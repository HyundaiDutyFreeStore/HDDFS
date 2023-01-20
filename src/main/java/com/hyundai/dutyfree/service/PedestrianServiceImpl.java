package com.hyundai.dutyfree.service;

import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.vo.PedestrianVO;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.bean.ColumnPositionMappingStrategy;
import au.com.bytecode.opencsv.bean.CsvToBean;

@Service
public class PedestrianServiceImpl implements PedestrianService {

	@Override
	public List<String[]> readCSV(String filename) {
		List<String[]> data = new ArrayList<String[]>();
		try {
			System.out.println("readCSV readCSV");
			// new CSVReader(InputStreamReader 객체, 구분자, 예외구문, 삭제할 열)
			// 구분자 : csv 구분자가 ',' 이므로 ,로 지정. 챕들 다른 표식일 경우 다른 것으로 지정도 가능
			// 예외구문 : "는 예외 구분
			// 삭제할 열 : 윗줄은 보통 설명문구일 경우가 많으므로 삭제하고 출력하고 싶은 경우 줄삭제가 가능하다
			CSVReader reader = new CSVReader(new InputStreamReader(new FileInputStream(filename), "UTF-8"), ',', '"',
					1);
			data = reader.readAll();

			reader.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
		return data;
	}

	@Override
	public List<PedestrianVO> readCsvToBean(String filename) {
		List<PedestrianVO> data = null;
		try {
			// csv 파일 읽기
			CSVReader reader = new CSVReader(new InputStreamReader(new FileInputStream(filename), "UTF-8"), ',', '"',
					0);

			// CSV 를 VO에 매핑해주는 매퍼 역할을 할 클래스 객체 생성
			ColumnPositionMappingStrategy<PedestrianVO> mapper = new ColumnPositionMappingStrategy<PedestrianVO>();
			mapper.setType(PedestrianVO.class); // VO파일을 맵핑하겠다.
			String[] columns = new String[] { "in", "out" }; // 각 컬럼을 정의할 배열
			mapper.setColumnMapping(columns); // 각 컬럼명을 매퍼에 설정

			// 매핑하기!!
			CsvToBean<PedestrianVO> csv = new CsvToBean<PedestrianVO>();
			data = csv.parse(mapper, reader); // (매핑방법, csv파일)

			reader.close();

		} catch (Exception e) {
			e.getStackTrace();
		}

		return data;
	}

}
