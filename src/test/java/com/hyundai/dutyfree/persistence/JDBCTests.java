package com.hyundai.dutyfree.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTests {
    static {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    @Test
    public void testConnection() {
        try(Connection con = 
                DriverManager.getConnection(
                        "jdbc:oracle:thin:@edudb_high?TNS_ADMIN=C:/dev/OracleWallet/Wallet_edudb",
                        "admin",
                        "xxxxxxAt21cc")){
            System.out.println(con);
        } catch (Exception e) {
            fail(e.getMessage());
        }
        
    }
}