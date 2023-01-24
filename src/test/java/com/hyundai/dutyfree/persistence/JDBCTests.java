package com.hyundai.dutyfree.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

/**
 * JDBCTest
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

public class JDBCTests {
    static {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
//    @Test
//    public void testConnection() {
//        try(Connection con = 
//                DriverManager.getConnection(
//                        "jdbc:oracle:thin:@edudb_high?TNS_ADMIN=C:/dev/OracleWallet/Wallet_edudb",
//                        "admin",
//                        "xxxxxxAt21cc")){
//            System.out.println(con);
//        } catch (Exception e) {
//            fail(e.getMessage());
//        }
//        
//    }
    
    @Test
    public void testConnection() {
        try(Connection con = 
                DriverManager.getConnection(
                        "jdbc:oracle:thin:@localhost:1521/xepdb1",
                        "hddfs",
                        "hddfs")){
            System.out.println(con);
        } catch (Exception e) {
            fail(e.getMessage());
        }
        
    }
}