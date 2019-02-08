package com.itbank.springProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.commons.dbcp.BasicDataSource;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.GenericApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

/**
 * Handles requests for the application home page.
 */
public class MyBatisTest {
	
	MyBatisTest() throws SQLException{
		ApplicationContext context = new GenericXmlApplicationContext("dataBase_ORACLE_Config.xml");
		
		//1번 실험
		//BasicDataSource basicDataSource = (BasicDataSource)context.getBean("dataSource");
		
		//String sql = "insert into member values('김아무개2','남')";
		
		//Connection con = basicDataSource.getConnection();
		//PreparedStatement ps = con.prepareStatement(sql);
		//ps.executeUpdate();
		
		
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setName("김아무개22");
		memberDTO.setGender("남22");
		
		MemberDAO memberDAO  = (MemberDAO)context.getBean("memberDAO");
		memberDAO.insert(memberDTO);
		
		
	}
	
	public static void main(String[] args) {
	  try {
		new MyBatisTest();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}	
	}
	
	
}
