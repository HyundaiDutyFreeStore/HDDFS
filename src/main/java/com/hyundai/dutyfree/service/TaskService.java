package com.hyundai.dutyfree.service;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

/**
 * TaskService
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
@Service
public class TaskService {

	@Scheduled(fixedDelay = 600000)
	public void mailSender() {
		System.out.println("스케줄링 테스트");
	}
}