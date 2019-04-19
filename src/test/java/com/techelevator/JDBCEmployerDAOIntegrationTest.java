package com.techelevator;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;

import com.techelevator.model.Employer;
import com.techelevator.model.EmployerDAO;
import com.techelevator.model.JDBCEmployerDAO;

public class JDBCEmployerDAOIntegrationTest extends DAOIntegrationTest {

	private EmployerDAO dao;
	private JdbcTemplate jdbcTemplate;

	@Before
	public void setUp() throws Exception {
		jdbcTemplate = new JdbcTemplate(getDataSource());
		dao = new JDBCEmployerDAO(getDataSource());
		clearEmployerTable();
	}

	// Test for createEmployer()
	@Test
	public void createEmployerAndWorksAsExpectedTest() {
		Employer employer = createEmployerObject();
		dao.createEmployer(employer);
		Assert.assertEquals(1, dao.getAllEmployers().size());
		Assert.assertTrue(dao.getAllEmployers().get(0).getCompanyName().equals("tco"));

	}

	// Test for getAllEmployers()
	@Test
	public void getAllEmployersTest() {
		insertEmployerIntoDatabase();
		List<Employer> employerList = dao.getAllEmployers();
		int allEmployers = employerList.size();
		assertEquals(1, allEmployers);
	}

	private void insertEmployerIntoDatabase() {
		String insertEmployerSQL = "INSERT INTO employer (employer_id, company_name, street_Address1, street_Address2, city, state, zip_code) "
				+ "VALUES (NEXTVAL('employer_employer_id_seq'), 'test company', '1234 GFTO lane', ' ', 'tacoland', 'OH', '43235')";
		jdbcTemplate.update(insertEmployerSQL);

	}

	private Employer createEmployerObject() {
		Employer employer = new Employer();
		employer.setEmployerId(null);
		employer.setCompanyName("tco");
		employer.setStreetAddress1("1700 Gemini Place");
		employer.setStreetAddress2("456");
		employer.setCity("Columbus");
		employer.setState("OH");
		employer.setZipCode("43065");
		return employer;
	}

	@Test
	public void createEmployerAdddressWorks() {
		Employer employer = createEmployerObject();
		dao.createEmployer(employer);
		Assert.assertEquals(1, dao.getAllEmployers().size());
		Assert.assertTrue(dao.getAllEmployers().get(0).getStreetAddress1().equals("1700 Gemini Place"));

	}

	@Test
	public void createEmployerAdddressWorks2() {
		Employer employer = createEmployerObject();
		dao.createEmployer(employer);
		Assert.assertEquals(1, dao.getAllEmployers().size());
		Assert.assertTrue(dao.getAllEmployers().get(0).getStreetAddress2().equals("456"));

	}

	@Test
	public void createEmployerCity() {
		Employer employer = createEmployerObject();
		dao.createEmployer(employer);
		Assert.assertEquals(1, dao.getAllEmployers().size());
		Assert.assertTrue(dao.getAllEmployers().get(0).getCity().equals("Columbus"));

	}

	@Test
	public void createEmployerState() {
		Employer employer = createEmployerObject();
		dao.createEmployer(employer);
		Assert.assertEquals(1, dao.getAllEmployers().size());
		Assert.assertTrue(dao.getAllEmployers().get(0).getState().equals("OH"));

	}

	@Test
	public void createEmployerZip() {
		Employer employer = createEmployerObject();
		dao.createEmployer(employer);
		Assert.assertEquals(1, dao.getAllEmployers().size());
		Assert.assertTrue(dao.getAllEmployers().get(0).getZipCode().equals("43065"));

	}

	private void clearEmployerTable() {
		String truncateEmployerTableSql = "TRUNCATE employer CASCADE";
		jdbcTemplate.update(truncateEmployerTableSql);
	}

}
