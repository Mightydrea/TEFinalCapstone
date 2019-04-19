package com.techelevator;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.model.JDBCUserDAO;
import com.techelevator.model.UserDAO;

public class JDBCUserDAOIntegrationTesting extends DAOIntegrationTest {
	
	private UserDAO dao;
	private JdbcTemplate jdbcTemplate;

	@Before
	public void setup() {
		jdbcTemplate = new JdbcTemplate(getDataSource());
		dao = new JDBCUserDAO(getDataSource(), null);
	}
//	//Test for saveUser()
//	@Test
//	public void saveUser()
	
//	@Test
//	public void searchForUsernameAndPasswordTest() {
//		
//	}
//	
//	@Test
//	public void updatePassword() {
//		
//	}
//	
//	@Test
//	public void getUserByUserName() {
//		
//	}
}

		