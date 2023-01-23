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

/**
 * Handles requests for the application home page.
 */
@AllArgsConstructor
@Controller
@RequestMapping("/common")
public class PedestrianController {
	@Autowired
	PedestrianService pedestrianservice = null;
	private static final Logger log = LoggerFactory.getLogger(PedestrianController.class);

	@RequestMapping(value = "/confusion", method = RequestMethod.GET)
	public String pedestraincount(HttpServletRequest request) {

		// 파일이 위치한 실제 경로
		String path = request.getSession().getServletContext().getRealPath("resources");
		String path_in = path + "\\loginside.csv";
		String path_out = path + "\\logoutside.csv";
		// 파일 경로에서 VO 저장된 리스트를 리턴
		List<PedestrianVO> data = pedestrianservice.readCsv(path_in);
		Iterator<PedestrianVO> it = data.iterator();
		int inside = 0;
		int outside = 0;
		while (it.hasNext()) {
			it.next();
			System.out.println(inside++);
		}
		data = pedestrianservice.readCsv(path_out);
		it = data.iterator();
		while (it.hasNext()) {
			it.next();
			System.out.println(outside++);
		}
		int count = inside - outside;
		count = Math.max(count, 0);
		log.info("inside :" + inside + ", outside : " + outside + ", count : " + count);

		return "/common/confusion";
	}

}
