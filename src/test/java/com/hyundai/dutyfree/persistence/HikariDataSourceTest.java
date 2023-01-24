package com.hyundai.dutyfree.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * HikariDataSourceTest
 * 
 * @author 김찬중
 * @since 01.09
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.09    김찬중                         최초 생성
 *        </pre>
 */

//xml설정방식 사용 시
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class HikariDataSourceTest {

	private static final Logger log = Logger.getLogger(HikariDataSourceTest.class);

	@Autowired
	private DataSource dataSource;
	
	@Test
	public void hikariDataSourceTest() {
		try {
			Connection con = dataSource.getConnection();
			log.info("'Connection객체 : " + con + "'");
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}