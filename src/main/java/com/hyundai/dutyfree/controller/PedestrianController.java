package com.hyundai.dutyfree.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hyundai.dutyfree.service.PedestrianService;
import com.hyundai.dutyfree.vo.PedestrianVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@AllArgsConstructor
@Controller
@RequestMapping("/common")
@Log4j
public class PedestrianController {
	@Autowired
	PedestrianService pedestrianservice = null;
	private static final Logger log = LoggerFactory.getLogger(PedestrianController.class);

	@RequestMapping(value = "/confusion", method = RequestMethod.GET)
	public String pedestraincount(HttpServletRequest request) {

		// 파일이 위치한 실제 경로 찾기
		String path = request.getSession().getServletContext().getRealPath("resources");
		path += "\\log.csv";
		// 파일 경로 던져주면, 데이터가 VO에 담긴 vo들이 저장된 리스트를 리턴받겠다.
		List<PedestrianVO> data = pedestrianservice.readCsvToBean(path);
		Iterator<PedestrianVO> it = data.iterator();
		int inside = 0;
		int outside = 0;
		while (it.hasNext()) {
			PedestrianVO vo = (PedestrianVO) it.next();
			inside = vo.getInside();
			outside = vo.getOutside();
		}
		log.info("inside :" + inside + ", outside : " + outside);

		return "/common/confusion";
	}

}
