package com.hyundai.dutyfree.controller;

import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.hyundai.dutyfree.service.OrderService;
import com.hyundai.dutyfree.service.PedestrianService;
import com.hyundai.dutyfree.vo.CustomerVO;
import com.hyundai.dutyfree.vo.OrderMemberVO;
import com.hyundai.dutyfree.vo.PedestrianVO;

/**
 * TaskController
 * 
 * @author 김찬중
 * @since 01.26
 * 
 *        <pre>
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.26    김찬중                        최초 생성
 *        </pre>
 */
@Controller
public class TaskController {

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private OrderService orderservice;
	@Autowired
	private PedestrianService pedestrianservice;
	
	public void getConf() {
		String path = "C:/resources";
		String path_in = path + "/analyzeReport/loginside.csv";
		String path_out = path + "/analyzeReport/logoutside.csv";
		// 파일 경로에서 VO 저장된 리스트를 리턴
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
	}
	
	@Scheduled(fixedDelay = 59999)
	public void mailSender() {
		System.out.println("고객에게 이메일 전송");
		SimpleDateFormat dformat = new SimpleDateFormat("yyyyMMddHH");
		/* 이메일 보내기 */
		List<OrderMemberVO> customer = orderservice.OrderMemberCheck();
		for (int i = 0; i < customer.size(); i++) {
			List<CustomerVO> LastMember = orderservice.LastMember(customer.get(i).getOdept(),
					dformat.format(customer.get(i).getOdeptdate()));
			StringBuilder sb = new StringBuilder();
			for (int j = 0; j < LastMember.size(); j++) {
				sb.append(LastMember.get(j).getHours());
				sb.append("시 : ");
				sb.append(LastMember.get(j).getCount());
				sb.append("명\n");
			}
			String confuse = sb.toString();
			String setFrom = "hdite1284@naver.com";
			String toMail = customer.get(i).getMemail();
			String title = customer.get(i).getMname() + "님 인도장 안내입니다.";
			String content = "<div class=\"content_wrap\">\n" + "			<h3 class=\"h3_type\">인도장/지점 안내</h3>\n"
					+ "			<div class=\"airport_img\"></div>\n" + "			<div class=\"accordion_list\">\n"
					+ "				<dl>\n" + "					<dt>\n" + "						<a>인천공항 T1 동편</a>\n"
					+ "					</dt>\n" + "					<dd>\n"
					+ "						<div class=\"airport_map_img\">\n" + "							<img\n"
					+ "								src=\"https://cdn.hddfs.com/files/om/20200831/3b429243_202008311038223570.jpg\"\n"
					+ "								alt=\"\"\n"
					+ "								onerror=\"this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/no_img760x267.jpg';\">\n"
					+ "\n" + "						</div>\n"
					+ "						<ul class=\"dot_list airport\">\n"
					+ "							<li><strong>위치안내</strong>11번 게이트 맞은편 4층</li>\n"
					+ "							<li><strong>문의안내</strong>인도장 : 1811-6688</li>\n"
					+ "							<li><strong>상담시간</strong>09:30 ~ 18:30</li>\n"
					+ "						</ul>\n" + "					</dd>\n" + "					<dt>\n"
					+ "						<a>인천공항 T1 서편</a>\n" + "					</dt>\n"
					+ "					<dd>\n" + "						<div class=\"airport_map_img\">\n"
					+ "							<img\n"
					+ "								src=\"https://cdn.hddfs.com/files/om/20200831/0742db50_202008311039325500.jpg\"\n"
					+ "								alt=\"\"\n"
					+ "								onerror=\"this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/no_img760x267.jpg';\">\n"
					+ "						</div>\n" + "						<ul class=\"dot_list airport\">\n"
					+ "							<li><strong>위치안내</strong>43번 게이트 맞은편 4층</li>\n"
					+ "							<li><strong>문의안내</strong>인도장 : 1811-6688</li>\n"
					+ "							<li><strong>상담시간</strong>09:30 ~ 18:30</li>\n"
					+ "						</ul>\n" + "					</dd>\n" + "					<dt>\n"
					+ "						<a>인천공항 T2</a>\n" + "					</dt>\n"
					+ "					<dd>\n" + "						<div class=\"airport_map_img\">\n"
					+ "							<img\n"
					+ "								src=\"https://cdn.hddfs.com/files/om/20181005/3431816b_201810051530069510.jpg\"\n"
					+ "								alt=\"\"\n"
					+ "								onerror=\"this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/no_img760x267.jpg';\">\n"
					+ "						</div>\n" + "						<ul class=\"dot_list airport\">\n"
					+ "							<li><strong>위치안내</strong>2번 출입국 심사대 통과 후 252번 게이트 건너편 4층</li>\n"
					+ "							<li><strong>문의안내</strong>인도장 : 1811-6688</li>\n"
					+ "							<li><strong>상담시간</strong>09:30 ~ 18:30</li>\n"
					+ "						</ul>\n" + "					</dd>\n" + "					<dt>\n"
					+ "						<a>김포공항</a>\n" + "					</dt>\n" + "					<dd>\n"
					+ "						<div class=\"airport_map_img\">\n" + "							<img\n"
					+ "								src=\"https://cdn.hddfs.com/files/om/20181005/014b0326_201810051531252800.jpg\"\n"
					+ "								alt=\"\"\n"
					+ "								onerror=\"this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/no_img760x267.jpg';\">\n"
					+ "						</div>\n" + "						<ul class=\"dot_list airport\">\n"
					+ "							<li><strong>위치안내</strong>출입국 심사대 통과 후 34번 게이트 맞은편</li>\n"
					+ "							<li><strong>문의안내</strong>인도장 : 1811-6688</li>\n"
					+ "							<li><strong>상담시간</strong>09:30 ~ 18:30</li>\n"
					+ "						</ul>\n" + "					</dd>\n" + "				</dl>\n"
					+ "			</div>\n" + "			<h4 class=\"h4_type line2 mgtsm\">이용 예정 고객 안내</h4>\n" + confuse
					+ "			<h4 class=\"h4_type line2 mgtsm\">실시간 혼잡도 안내</h4>\n"
					+ "		</div>";
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content, true);
				mailSender.send(message);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}