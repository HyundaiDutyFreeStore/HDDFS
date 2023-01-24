package com.hyundai.dutyfree.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyundai.dutyfree.service.OrderService;
import com.hyundai.dutyfree.service.PedestrianService;
import com.hyundai.dutyfree.vo.CustomerVO;
import com.hyundai.dutyfree.vo.PedestrianVO;

import lombok.AllArgsConstructor;

/**
 * PedestrianController
 *
 * @author 김찬중
 * @since 01.20
 *
 *        <pre>
 * 수정일                 수정자                          수정내용
 * ----------  ---------------      ---------------------------
 * 2023.01.20	  김찬중			       최초생성
 *        </pre>
 */

@AllArgsConstructor
@Controller
@RequestMapping("/common")
public class PedestrianController {
	@Autowired
	PedestrianService pedestrianservice;

	@Autowired
	OrderService orderservice;
	private static final Logger log = LoggerFactory.getLogger(PedestrianController.class);

	@ResponseBody
	@GetMapping(value = "/conf", produces = "application/json;")
	public String getConf(HttpServletRequest request) {

		// 파일이 위치한 실제 경로
		String path = request.getSession().getServletContext().getRealPath("resources");
		String path_in = path + "\\loginside.csv";
		String path_out = path + "\\logoutside.csv"; // 파일 경로에서 VO 저장된 리스트를 리턴
		List<PedestrianVO> data = pedestrianservice.readCsv(path_in);
		Iterator<PedestrianVO> it = data.iterator();
		int inside = 0;
		int outside = 0;
		while (it.hasNext()) {
			it.next();
			inside++;
		}
		data = pedestrianservice.readCsv(path_out);
		it = data.iterator();
		while (it.hasNext()) {
			it.next();
			outside++;
		}
		int count = inside - outside;
		count = Math.max(count, 0);
		log.info("inside :" + inside + ", outside : " + outside + ", count : " + count);

		JSONObject jsonObj = new JSONObject();
		// 현재인원
		jsonObj.put("cnt", count);
		String json = jsonObj.toString();
		return json;
	}

	@ResponseBody
	@GetMapping(value = "/conffut", produces = "application/json;")
	public String getConfFut(HttpServletRequest request) {

		List<CustomerVO> getCustomerPerTime = orderservice.getCustomerPerTime(request.getParameter("odeptdate"));
		// List<CustomerVO> getCustomerPerTime = orderservice.getCustomerPerTime("20230120");
		JSONObject jsonObj = new JSONObject();
		// 시간대별 인원
		for (int i = 0; i < 24; i++) {
			jsonObj.put(String.valueOf(i), getCustomerPerTime.get(i).getCount());
		}
		String json = jsonObj.toString();
		System.out.println(json);
		return json;
	}
}
