package com.hyundai.dutyfree.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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

	public int realTimeConfusion() {
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
		return count;
	}

	String mailHeader = "<div class=\"mail_view_body\">\n" + "    <div class=\"mail_view_contents\">\n"
			+ "        <div class=\"mail_view_contents_inner\" data-translate-body-10260=\"\">\n"
			+ "            <div>\n" + "                <div style=\"width:700px;margin:0 auto\">\n"
			+ "                    <div><img src=\"https://cdn.hddfs.com/files/images/email/mail_top.jpg\" alt=\"현대백화점면세점\"\n"
			+ "                            style=\"border:none;vertical-align:top\" loading=\"lazy\"></div>\n"
			+ "                    <div\n"
			+ "                        style=\"width:698px;border-left:1px solid #e6e6e6;border-right:1px solid #e6e6e6;padding:60px 0\">\n"
			+ "                        ";
	String mailFooter = "<div style=\"margin-top:30px;text-align:center\">\n"
			+ "                                <a href=\"http://localhost:8080/\" target=\"_blank\"\n"
			+ "                                    style=\"display:inline-block;padding:18px 20px;min-:160px;font-size:16px;color:#fff;text-align:center;font-family:'나눔고딕', '맑은 고딕', 'dotum', 'applesdgothicneo';letter-spacing:-.05em;text-decoration:none;background-color:#c51315\"\n"
			+ "                                    rel=\"noreferrer noopener\">현대백화점인터넷면세점</a>\n"
			+ "                            </div>\n" + "                        </div>\n"
			+ "                    </div>\n"
			+ "                    <div style=\"padding:30px;border:1px solid #e6e6e6;background-color:#fafafa\">\n"
			+ "                        <p\n"
			+ "                            style=\"padding:0;margin:0;color:#999;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                            본 메일은 발신전용으로 회신되지 않습니다. 궁금하신 사항은 [<a href=\"https://www.hddfs.com/shop/om/consmComm/main.do\"\n"
			+ "                                target=\"_blank\" style=\"color:#000\" rel=\"noreferrer noopener\">여기</a>]를 클릭하여 문의해 주시기\n"
			+ "                            바랍니다.<br><span style=\"font-size:11px\">If you have questions, Please contact us by clicking\n"
			+ "                                <a href=\"https://www.hddfs.com/shop/om/consmComm/main.do\" target=\"_blank\"\n"
			+ "                                    style=\"color:#000\" rel=\"noreferrer noopener\">here.</a></span></p>\n"
			+ "                        <p\n"
			+ "                            style=\"padding:0;margin:12px 0 0 0;color:#999;font-size:13px;line-height:24px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                            주식회사 현대백화점면세점 대표이사 : 이재실<i\n"
			+ "                                style=\"display:inline-block;margin:0 10px;width:1px;height:10px;background-color:#c8c8c8;vertical-align:middle\"></i>서울특별시\n"
			+ "                            강남구 영동대로82길 19</p>\n" + "                        <p\n"
			+ "                            style=\"padding:0;margin:0;color:#999;font-size:13px;line-height:24px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                            사업자등록번호 : 850-88-00325 [<a\n"
			+ "                                href=\"http://www.ftc.go.kr/bizCommPop.do?wrkr_no=8508800325&amp;apv_perm_no=\"\n"
			+ "                                target=\"_blank\" style=\"color:#666\" rel=\"noreferrer noopener\">사업자정보확인</a>]<i\n"
			+ "                                style=\"display:inline-block;margin:0 10px;width:1px;height:10px;background-color:#c8c8c8;vertical-align:middle\"></i>통신판매업신고\n"
			+ "                            : 2018-서울강남-02228</p>\n" + "                        <p\n"
			+ "                            style=\"padding:0;margin:0;color:#999;font-size:13px;line-height:24px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                            개인정보보호책임자 : 채광익<i\n"
			+ "                                style=\"display:inline-block;margin:0 10px;width:1px;height:10px;background-color:#c8c8c8;vertical-align:middle\"></i>호스팅사업자\n"
			+ "                            : (주)현대백화점면세점</p>\n" + "                        <p\n"
			+ "                            style=\"padding:0;margin:0;color:#999;font-size:13px;line-height:24px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                            대표번호 : 1811-6688<i\n"
			+ "                                style=\"display:inline-block;margin:0 10px;width:1px;height:10px;background-color:#c8c8c8;vertical-align:middle\"></i>대표메일\n"
			+ "                            : hddfs_official@hddfs.com</p>\n" + "                        <p\n"
			+ "                            style=\"padding:0;margin:12px 0 0 0;color:#999;font-size:11px;line-height:24px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                            COPYRIGHT ⓒ HYUNDAI DEPARTMENT STORE DUTY FREE. ALL RIGHTS RESERVED.</p>\n"
			+ "                        <div style=\"margin-top:20px;text-align:right\"><a href=\"https://www.hddfs.com/shop/dm/main.do\"\n"
			+ "                                target=\"_blank\" rel=\"noreferrer noopener\"><img\n"
			+ "                                    src=\"https://cdn.hddfs.com/files/images/email/footer_logo.jpg\" alt=\"현대백화점면세점\"\n"
			+ "                                    style=\"border:none;vertical-align:top\" loading=\"lazy\"></a></div>\n"
			+ "                    </div>\n" + "                </div>\n"
			+ "                <div style=\"display:none\"><img width=\"0\" height=\"0\"\n"
			+ "                        src=\"https://tms.hddfs.com/TMS/tracking?TV9JRD0yMjcyODM4N182OTMxMDE4&amp;U1RZUEU9QVVUTw==&amp;p_id=20230111_7&amp;m_id=22728387_6931018&amp;s_tp=AUTO&amp;TElTVF9UQUJMRT1UTVNfQVVUT19TRU5EX0xJU1RfMDE=&amp;UE9TVF9JRD0yMDIzMDExMV83&amp;U0VSVkVSX0lEPTAx&amp;VEM9MjAyMzAxMTg=&amp;S0lORD1P\"\n"
			+ "                        loading=\"lazy\"></div>\n" + "            </div>\n" + "        </div>\n"
			+ "    </div>\n" + "</div>";
	String Notice = "<div style=\"margin-top:40px;padding:20px;border:1px solid #e5e5e5\">\n"
			+ "                                <p\n"
			+ "                                    style=\"padding:0;margin:0;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                    유의사항</p>\n"
			+ "                                <ul style=\"list-style:none;padding:10px 0 0 0;margin:0\">\n"
			+ "                                    <li\n"
			+ "                                        style=\"padding:0;margin:0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                        · 매장 판매분으로 인해, 입금완료 이후라도 입금 시점에 따라 재고부족으로 자동취소 될 수 있습니다.</li>\n"
			+ "                                    <li\n"
			+ "                                        style=\"padding:0;margin:5px 0 0 0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                        · 가상계좌의 입금가능 기한은 주문 당일 23:54분까지이며, 미 입금 시 자동으로 취소됩니다.</li>\n"
			+ "                                    <li\n"
			+ "                                        style=\"padding:0;margin:5px 0 0 0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                        · 입금 후 자동 취소된 주문의 경우 에스크로 절차로 인해 환불기간이 3~5일 정도 더 소요될 수 있습니다.</li>\n"
			+ "                                    <li\n"
			+ "                                        style=\"padding:0;margin:5px 0 0 0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                        · 등록된 환불계좌가 없는 경우, 예치금으로 환불 처리됩니다. (추후 출금 가능)</li>\n"
			+ "                                    <li\n"
			+ "                                        style=\"padding:0;margin:5px 0 0 0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                        · 다음의 경우 출국 시 공항에서 상품 수령이 불가능 하오니 반드시 확인해 주시기 바랍니다.\n"
			+ "                                        <p style=\"padding:0 0 0 10px;margin:5px 0 0 0\">- 주문하신 고객님과 출국하시는 고객님의 정보가 불일치 할\n"
			+ "                                            경우<br>- 주문서에 기재된 여권번호와 출국 시 여권번호가 불일치 할 경우<br>- 출국정보(출국장소, 출국일시, 편명 등)가 실제와\n"
			+ "                                            다른 경우</p>\n" + "                                    </li>\n"
			+ "                                    <li\n"
			+ "                                        style=\"padding:0;margin:5px 0 0 0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                        · 출국 정보 변경을 원하실 경우, 출국 3일전에 고객센터로 연락해 주시기 바랍니다(단, 지방공항 이용 시 4일전)</li>\n"
			+ "                                    <li\n"
			+ "                                        style=\"padding:0;margin:5px 0 0 0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                        · 출국 시 인도받지 못한 물건은 고객센터로 연락 주시면 취소 절차를 거쳐 환불 처리 됩니다.</li>\n"
			+ "                                    <li\n"
			+ "                                        style=\"padding:0;margin:5px 0 0 0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                        · 주문에 대해 궁금하신 사항은 FAQ에서 확인이 가능합니다. </li>\n"
			+ "                                    <li\n"
			+ "                                        style=\"padding:0;margin:5px 0 0 0;font-size:13px;text-align:left;font-weight:normal;color:#999;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                        · 추가 궁금한 내용은 고객센터(1811-6688)로 문의바랍니다.</li>\n"
			+ "                                </ul>\n" + "                            </div>";
	String ICNT1 = "<p\n"
			+ "                                style=\"padding:0;margin:37px 0 8px 0;color:#333;font-size:20px;line-height:20px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                인도장 안내</p>\n"
			+ "                            <div style=\"border:1px solid #e5e5e5;padding:18px;\">\n"
			+ "                                <div style=\"padding:0;margin:0;border:1px solid #e5e5e5;line-height:0\"><img\n"
			+ "                                        src=\"https://cdn.hddfs.com/files/om/20200831/3b429243_202008311038223570.jpg\"\n"
			+ "                                        alt=\"인도장 안내\" style=\"border:none;vertical-align:top;width:100%\" loading=\"lazy\">\n"
			+ "                                </div>\n"
			+ "                                <div style=\"overflow:hidden;margin:8px 0 0 0;padding:0; width:600px;\">\n"
			+ "                                    <dl style=\"float:left;width:40%;padding:0;margin:0\">\n"
			+ "                                        <dt\n"
			+ "                                            style=\"padding:0;margin:0;color:#333;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            · 위치안내</dt>\n"
			+ "                                        <dd\n"
			+ "                                            style=\"padding:0 0 0 10px;margin:3px 0 0 0;color:#666;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            인천공항 T1 동편 11번 게이트 맞은편 4층</dd>\n"
			+ "                                    </dl>\n"
			+ "                                    <dl style=\"float:left;width:30%;padding:0;margin:0\">\n"
			+ "                                        <dt\n"
			+ "                                            style=\"padding:0;margin:0;color:#333;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            · 문의안내</dt>\n"
			+ "                                        <dd\n"
			+ "                                            style=\"padding:0 0 0 10px;margin:3px 0 0 0;color:#666;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            인도장 : 1811-6688</dd>\n"
			+ "                                    </dl>\n"
			+ "                                    <dl style=\"float:left;width:30%;padding:0;margin:0\">\n"
			+ "                                        <dt\n"
			+ "                                            style=\"padding:0;margin:0;color:#333;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            · 상담시간</dt>\n"
			+ "                                        <dd\n"
			+ "                                            style=\"padding:0 0 0 10px;margin:3px 0 0 0;color:#666;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            08:00~22:30</dd>\n"
			+ "                                    </dl>\n" + "                                </div>\n"
			+ "                            </div>";
	String ICNT2 = "<p\n"
			+ "                                style=\"padding:0;margin:37px 0 8px 0;color:#333;font-size:20px;line-height:20px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                인도장 안내</p>\n"
			+ "                            <div style=\"border:1px solid #e5e5e5;padding:18px;\">\n"
			+ "                                <div style=\"padding:0;margin:0;border:1px solid #e5e5e5;line-height:0\"><img\n"
			+ "                                        src=\"https://cdn.hddfs.com/files/om/20181005/3431816b_201810051530069510.jpg\"\n"
			+ "                                        alt=\"인도장 안내\" style=\"border:none;vertical-align:top;width:100%\" loading=\"lazy\">\n"
			+ "                                </div>\n"
			+ "                                <div style=\"overflow:hidden;margin:8px 0 0 0;padding:0; width:600px;\">\n"
			+ "                                    <dl style=\"float:left;width:40%;padding:0;margin:0\">\n"
			+ "                                        <dt\n"
			+ "                                            style=\"padding:0;margin:0;color:#333;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            · 위치안내</dt>\n"
			+ "                                        <dd\n"
			+ "                                            style=\"padding:0 0 0 10px;margin:3px 0 0 0;color:#666;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            인천공항 T2 252번 게이트 건너편 4층</dd>\n"
			+ "                                    </dl>\n"
			+ "                                    <dl style=\"float:left;width:30%;padding:0;margin:0\">\n"
			+ "                                        <dt\n"
			+ "                                            style=\"padding:0;margin:0;color:#333;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            · 문의안내</dt>\n"
			+ "                                        <dd\n"
			+ "                                            style=\"padding:0 0 0 10px;margin:3px 0 0 0;color:#666;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            인도장 : 1811-6688</dd>\n"
			+ "                                    </dl>\n"
			+ "                                    <dl style=\"float:left;width:30%;padding:0;margin:0\">\n"
			+ "                                        <dt\n"
			+ "                                            style=\"padding:0;margin:0;color:#333;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            · 상담시간</dt>\n"
			+ "                                        <dd\n"
			+ "                                            style=\"padding:0 0 0 10px;margin:3px 0 0 0;color:#666;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            08:00~22:30</dd>\n"
			+ "                                    </dl>\n" + "                                </div>\n"
			+ "                            </div>";
	String GMP = "<p\n"
			+ "                                style=\"padding:0;margin:37px 0 8px 0;color:#333;font-size:20px;line-height:20px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                인도장 안내</p>\n"
			+ "                            <div style=\"border:1px solid #e5e5e5;padding:18px;\">\n"
			+ "                                <div style=\"padding:0;margin:0;border:1px solid #e5e5e5;line-height:0\"><img\n"
			+ "                                        src=\"https://cdn.hddfs.com/files/om/20181005/014b0326_201810051531252800.jpg\"\n"
			+ "                                        alt=\"인도장 안내\" style=\"border:none;vertical-align:top;width:100%\" loading=\"lazy\">\n"
			+ "                                </div>\n"
			+ "                                <div style=\"overflow:hidden;margin:8px 0 0 0;padding:0; width:600px;\">\n"
			+ "                                    <dl style=\"float:left;width:40%;padding:0;margin:0\">\n"
			+ "                                        <dt\n"
			+ "                                            style=\"padding:0;margin:0;color:#333;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            · 위치안내</dt>\n"
			+ "                                        <dd\n"
			+ "                                            style=\"padding:0 0 0 10px;margin:3px 0 0 0;color:#666;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            김포공항 34번 게이트 맞은편</dd>\n"
			+ "                                    </dl>\n"
			+ "                                    <dl style=\"float:left;width:30%;padding:0;margin:0\">\n"
			+ "                                        <dt\n"
			+ "                                            style=\"padding:0;margin:0;color:#333;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            · 문의안내</dt>\n"
			+ "                                        <dd\n"
			+ "                                            style=\"padding:0 0 0 10px;margin:3px 0 0 0;color:#666;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            인도장 : 1811-6688</dd>\n"
			+ "                                    </dl>\n"
			+ "                                    <dl style=\"float:left;width:30%;padding:0;margin:0\">\n"
			+ "                                        <dt\n"
			+ "                                            style=\"padding:0;margin:0;color:#333;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            · 상담시간</dt>\n"
			+ "                                        <dd\n"
			+ "                                            style=\"padding:0 0 0 10px;margin:3px 0 0 0;color:#666;font-size:13px;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
			+ "                                            08:00~22:30</dd>\n"
			+ "                                    </dl>\n" + "                                </div>\n"
			+ "                            </div>";
	String terminal = "";

	@Scheduled(fixedDelay = 59999)
	public void mailSender() {
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		String formatedNow = now.format(formatter);
		System.out.println("Spring Scheduler 작동 " + formatedNow);
		SimpleDateFormat dformat = new SimpleDateFormat("yyyyMMddHH");
		/* 이메일 보내기 */
		List<OrderMemberVO> customer3h = orderservice.OrderMemberCheck();
		for (int i = 0; i < customer3h.size(); i++) {
			List<CustomerVO> LastMember = orderservice.LastMember(customer3h.get(i).getOdept(),
					dformat.format(customer3h.get(i).getOdeptdate()));
			StringBuilder sb = new StringBuilder();
			for (int j = 0; j < LastMember.size(); j++) {
				sb.append(LastMember.get(j).getHours());
				sb.append("시 : ");
				sb.append(LastMember.get(j).getCount());
				sb.append("명");
				if (j < LastMember.size() - 1)
					sb.append("&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;");
			}
			String confuse = sb.toString();
			String dept = customer3h.get(i).getOdept();

			switch (dept) {
			case "ICNT1":
				terminal = ICNT1;
				break;
			case "ICNT2":
				terminal = ICNT2;
				break;
			case "GMP":
				terminal = GMP;
				break;
			}

			String setFrom = "hdite1284@naver.com";
			String toMail = customer3h.get(i).getMemail();
			String title = customer3h.get(i).getMname() + "님 인도장 안내입니다.";
			String content = mailHeader + "<p\n"
					+ "                            style=\"padding:0;margin:0;color:#333;text-align:center;font-size:40px;line-height:100%;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.1em\">\n"
					+ "                            인도장 안내</p>\n" + "                        <p\n"
					+ "                            style=\"padding:0;margin:25px 0 0 0;color:#666;text-align:center;font-size:14px;line-height:20px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
					+ "                            <span style=\"color:#333;font-size:18px\">"
					+ customer3h.get(i).getMname() + "</span> 고객님 안녕하세요.<br>현대백화점인터넷면세점을 이용해주셔서\n"
					+ "                            감사합니다.<br>고객님께서 주문하신 면세품 인도 시간이 3시간 남았습니다. <br> 인도장과 혼잡도를 확인하시어 여정 출발 전 면세품 인도를 해주시기 바랍니다.\n"
					+ "                        </p>\n" + "                        <div style=\"padding:0 30px\">\n"
					+ "                            <p\n"
					+ "                                style=\"padding:0;margin:37px 0 8px 0;color:#333;font-size:20px;line-height:20px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
					+ "                                주문 정보</p>\n"
					+ "                            <table style=\"width:638px;table-layout:fixed;border-spacing:0;border-top:1px solid #e5e5e5\">\n"
					+ "                                <colgroup>\n"
					+ "                                    <col style=\"width:120px\">\n"
					+ "                                    <col style=\"width:auto\">\n"
					+ "                                    <col style=\"width:120px\">\n"
					+ "                                    <col style=\"width:auto\">\n"
					+ "                                </colgroup>\n" + "                                <tbody>\n"
					+ "                                    <tr>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            주문번호</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            OR2023011100182</td>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            출국일시</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            " + customer3h.get(i).getOdeptdate() + "</td>\n"
					+ "                                    </tr>\n" + "                                    <tr>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            성명</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            " + customer3h.get(i).getMname() + "</td>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            국적</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            한국</td>\n"
					+ "                                    </tr>\n" + "                                    <tr>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            출국장소</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ customer3h.get(i).getOdept() + "</td>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                        </th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                        </td>\n" + "                                    </tr>\n"
					+ "                                </tbody>\n" + "                            </table>" + "<p\n"
					+ "                                style=\"padding:0;margin:37px 0 8px 0;color:#333;font-size:20px;line-height:20px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
					+ "                                인도장 정보</p>\n"
					+ "                            <table style=\"width:638px;table-layout:fixed;border-spacing:0;border-top:1px solid #e5e5e5\">\n"
					+ "                                <colgroup>\n"
					+ "                                    <col style=\"width:120px\">\n"
					+ "                                    <col style=\"width:auto\">\n"
					+ "                                </colgroup>\n" + "                                <tbody>\n"
					+ "\n" + "                                    <tr>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            시간 / 명</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:center;font-weight:normal;color:#333;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ confuse + "</td>\n" + "                                    </tr>\n" + "\n" + "<tr>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            실시간 대기자</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:center;font-weight:normal;color:#333;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            " + realTimeConfusion() + "명</td>\n"
					+ "                                    </tr>" + "                                </tbody>\n"
					+ "                            </table>" + terminal + Notice + mailFooter;
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
		List<OrderMemberVO> customer30m = orderservice.LastHalfMember();
		for (int i = 0; i < customer30m.size(); i++) {
			List<CustomerVO> LastMember = orderservice.LastMember(customer30m.get(i).getOdept(),
					dformat.format(customer30m.get(i).getOdeptdate()));
			StringBuilder sb = new StringBuilder();
			for (int j = 0; j < LastMember.size(); j++) {
				sb.append(LastMember.get(j).getHours());
				sb.append("시 : ");
				sb.append(LastMember.get(j).getCount());
				sb.append("명\n");
			}
			String setFrom = "hdite1284@naver.com";
			String toMail = customer30m.get(i).getMemail();
			String title = "<긴급>" + customer30m.get(i).getMname() + "님 면세품 인도 안내입니다.";
			String content = mailHeader + "<p\n"
					+ "                            style=\"padding:0;margin:0;color:#333;text-align:center;font-size:40px;line-height:100%;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.1em\">\n"
					+ "                            면세품 인도 안내</p>\n" + "                        <p\n"
					+ "                            style=\"padding:0;margin:25px 0 0 0;color:#666;text-align:center;font-size:14px;line-height:20px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
					+ "                            <span style=\"color:#333;font-size:18px\">"
					+ customer3h.get(i).getMname() + "</span> 고객님 안녕하세요.<br>현대백화점인터넷면세점을 이용해주셔서\n"
					+ "                            감사합니다.<br>고객님께서 주문하신 면세품 인도 시간이 30분 남았습니다. <br> 인도장과 혼잡도를 확인하시어 여정 출발 전 면세품 인도를 해주시기 바랍니다.\n"
					+ "                        </p>\n" + "                        <div style=\"padding:0 30px\">\n"
					+ "                            <p\n"
					+ "                                style=\"padding:0;margin:37px 0 8px 0;color:#333;font-size:20px;line-height:20px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
					+ "                                주문 정보</p>\n"
					+ "                            <table style=\"width:638px;table-layout:fixed;border-spacing:0;border-top:1px solid #e5e5e5\">\n"
					+ "                                <colgroup>\n"
					+ "                                    <col style=\"width:120px\">\n"
					+ "                                    <col style=\"width:auto\">\n"
					+ "                                    <col style=\"width:120px\">\n"
					+ "                                    <col style=\"width:auto\">\n"
					+ "                                </colgroup>\n" + "                                <tbody>\n"
					+ "                                    <tr>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            주문번호</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            OR2023011100182</td>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            출국일시</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            " + customer3h.get(i).getOdeptdate() + "</td>\n"
					+ "                                    </tr>\n" + "                                    <tr>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            성명</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            " + customer3h.get(i).getMname() + "</td>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            국적</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            한국</td>\n"
					+ "                                    </tr>\n" + "                                    <tr>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            출국장소</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ customer3h.get(i).getOdept() + "</td>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                        </th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                        </td>\n" + "                                    </tr>\n"
					+ "                                </tbody>\n" + "                            </table>" + "<p\n"
					+ "                                style=\"padding:0;margin:37px 0 8px 0;color:#333;font-size:20px;line-height:20px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
					+ "                                인도장 정보</p>\n"
					+ "                            <table style=\"width:638px;table-layout:fixed;border-spacing:0;border-top:1px solid #e5e5e5\">\n"
					+ "                                <colgroup>\n"
					+ "                                    <col style=\"width:120px\">\n"
					+ "                                    <col style=\"width:auto\">\n"
					+ "                                </colgroup>\n" + "                                <tbody>\n"
					+ "\n" + "                                    <tr>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            실시간 대기자</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:center;font-weight:normal;color:#333;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ realTimeConfusion() + "명 예상 대기 시간은 " + Math.floor(realTimeConfusion() / 3) * 3 + "분 입니다.</td>\n"
					+ "                                    </tr>\n" + "\n"
					+ "                                </tbody>\n" + "                            </table>" + Notice
					+ mailFooter;
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
		List<OrderMemberVO> customerfail = orderservice.FailMember();
		for (int i = 0; i < customerfail.size(); i++) {
			String setFrom = "hdite1284@naver.com";
			String toMail = customerfail.get(i).getMemail();
			String title = customerfail.get(i).getMname() + "님 미인도 안내입니다.";
			String content = mailHeader + "<p\n"
					+ "                            style=\"padding:0;margin:0;color:#333;text-align:center;font-size:40px;line-height:100%;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.1em\">\n"
					+ "                            미인도 안내</p>\n" + "                        <p\n"
					+ "                            style=\"padding:0;margin:25px 0 0 0;color:#666;text-align:center;font-size:14px;line-height:20px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
					+ "                            <span style=\"color:#333;font-size:18px\">"
					+ customer3h.get(i).getMname() + "</span> 고객님 안녕하세요.<br>현대백화점인터넷면세점을 이용해주셔서\n"
					+ "                            감사합니다.<br>고객님께서 주문하신 면세품 인도 시간이 30분 남았습니다. <br> 인도장과 혼잡도를 확인하시어 여정 출발 전 면세품 인도를 해주시기 바랍니다.\n"
					+ "                        </p>\n" + "                        <div style=\"padding:0 30px\">\n"
					+ "                            <p\n"
					+ "                                style=\"padding:0;margin:37px 0 8px 0;color:#333;font-size:20px;line-height:20px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';letter-spacing:-.05em\">\n"
					+ "                                주문 정보</p>\n"
					+ "                            <table style=\"width:638px;table-layout:fixed;border-spacing:0;border-top:1px solid #e5e5e5\">\n"
					+ "                                <colgroup>\n"
					+ "                                    <col style=\"width:120px\">\n"
					+ "                                    <col style=\"width:auto\">\n"
					+ "                                    <col style=\"width:120px\">\n"
					+ "                                    <col style=\"width:auto\">\n"
					+ "                                </colgroup>\n" + "                                <tbody>\n"
					+ "                                    <tr>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            주문번호</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            OR2023011100182</td>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            출국일시</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            " + customer3h.get(i).getOdeptdate() + "</td>\n"
					+ "                                    </tr>\n" + "                                    <tr>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            성명</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            " + customer3h.get(i).getMname() + "</td>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            국적</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            한국</td>\n"
					+ "                                    </tr>\n" + "                                    <tr>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            출국장소</th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                            인천공항</td>\n"
					+ "                                        <th colspan=\"1\" rowspan=\"1\" scope=\"row\"\n"
					+ "                                            style=\"padding:0 0 0 0px;font-size:13px;text-align:center;line-height:18px;font-weight:normal;color:#666;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';background-color:#f9f9f9;border-bottom:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                        </th>\n"
					+ "                                        <td\n"
					+ "                                            style=\"padding:14px 20px;font-size:13px;text-align:left;font-weight:normal;color:#666;line-height:18px;font-family:'나눔고딕', '맑은 고딕', 'Dotum', 'AppleSDGothicNeo';border-bottom:1px solid #e5e5e5;border-left:1px solid #e5e5e5;letter-spacing:-.05em\">\n"
					+ "                                        </td>\n" + "                                    </tr>\n"
					+ "                                </tbody>\n" + "                            </table>" + Notice
					+ mailFooter;
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