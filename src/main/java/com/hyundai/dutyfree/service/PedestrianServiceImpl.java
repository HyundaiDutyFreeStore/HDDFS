package com.hyundai.dutyfree.service;

import java.io.FileReader;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.vo.PedestrianVO;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.bean.ColumnPositionMappingStrategy;
import au.com.bytecode.opencsv.bean.CsvToBean;

/**
 * PedestrianServiceImpl
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

@Service
public class PedestrianServiceImpl implements PedestrianService {

	@Override
	public List<PedestrianVO> readCsv(String filename) {
		List<PedestrianVO> data = null;
		try {
			// csv 파일 읽기
			CSVReader reader = new CSVReader(new FileReader(filename));

			// CSV 를 VO에 매핑해주는 매퍼 역할을 할 클래스 객체 생성
			ColumnPositionMappingStrategy<PedestrianVO> mapper = new ColumnPositionMappingStrategy<PedestrianVO>();
			mapper.setType(PedestrianVO.class); // VO파일을 맵핑
			String[] columns = new String[] { "count" }; // 각 컬럼을 정의할 배열
			mapper.setColumnMapping(columns); // 각 컬럼명을 매퍼에 설정

			// 매핑
			CsvToBean<PedestrianVO> csv = new CsvToBean<PedestrianVO>();
			data = csv.parse(mapper, reader); // (매핑방법, csv파일)

			reader.close();

		} catch (Exception e) {
			e.getStackTrace();
		}

		return data;
	}

}
