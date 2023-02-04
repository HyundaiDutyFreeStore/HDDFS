package com.hyundai.dutyfree.service;

import java.util.List;

import com.hyundai.dutyfree.vo.PedestrianVO;

/**
 * PedestrianService
 *
 * @author 김찬중
 * @since 01.21
 *
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.21	 김찬중			최초 생성
 *        </pre>
 */
public interface PedestrianService {
	// 혼잡도 측정
	public List<PedestrianVO> readCsv(String filename);
}
