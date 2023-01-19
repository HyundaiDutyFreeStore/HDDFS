package com.hyundai.dutyfree.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.hyundai.dutyfree.service.ExchangerateService;
import com.hyundai.dutyfree.vo.ExchangerateVO;

import lombok.AllArgsConstructor;

/**
 * Handles requests for the application home page.
 */
@Controller
@AllArgsConstructor
public class HomeController {

	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	메인페이지 접속

	@Autowired
	private ExchangerateService erservice;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);
		System.out.println("메인페이지 진입");
		model.addAttribute("serverTime", formattedDate);
		// 환율 API 적용 -> 공공데이터포털 openAPI
		String result = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar c1 = Calendar.getInstance();
		c1.add(Calendar.DATE, -1);
		String strToday = sdf.format(c1.getTime());
		try {

			URL url = new URL(
					"https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=uZmFXmU6tqwDHzhmZpmO1PW44bOPGHht&searchdate="
							+ strToday + "&data=AP01");

			BufferedReader bf;

			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine();
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonArray arr = element.getAsJsonArray();
			String usdstr = arr.get(22).getAsJsonObject().get("deal_bas_r").getAsString();
			double KRW = Math.round(Float.valueOf(usdstr.replace(",", "")) * 100 / 100.0);
			String eurstr = arr.get(8).getAsJsonObject().get("deal_bas_r").getAsString();
			double EUR = Math.round(KRW / Float.valueOf(eurstr.replace(",", "")) * 100) / 100.0;
			double CNY = Math.round(KRW / arr.get(6).getAsJsonObject().get("deal_bas_r").getAsFloat() * 100) / 100.0;
			double JPY = Math.round(KRW / arr.get(12).getAsJsonObject().get("deal_bas_r").getAsFloat() * 10000) / 100.0;
			//System.out.println("CNY : " + CNY + ", JPY : " + JPY + ", KRW : " + KRW + ", EUR : " + EUR);
			String[] country = { "KRW", "EUR", "CNY", "JPY" };
			double[] money = { KRW, EUR, CNY, JPY };

			for (int i = 0; i < 4; i++) {
				ExchangerateVO evo = new ExchangerateVO();
				evo.setMcountry(country[i]);
				evo.setMmoney(money[i]);
				erservice.updateExchangerate(evo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "Index";
	}

}
