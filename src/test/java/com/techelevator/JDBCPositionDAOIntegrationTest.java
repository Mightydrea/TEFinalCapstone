package com.techelevator;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.model.JDBCPositionDAO;
import com.techelevator.model.Position;
import com.techelevator.model.PositionDAO;

import junit.framework.Assert;

public class JDBCPositionDAOIntegrationTest extends DAOIntegrationTest {

	private PositionDAO dao;
	private JdbcTemplate jdbcTemplate;

	@Before
	public void setup() {
		jdbcTemplate = new JdbcTemplate(getDataSource());
		dao = new JDBCPositionDAO(getDataSource());
		clearPositionTable();
		clearEmployerTable();
		insertEmployerIntoDatabase();
	}
	//Tests for addPosition() 
	@Test
	public void addPositionReturnsCorrectSize() {
		Position position = createPositionObject();
		dao.addPosition(position);
		Assert.assertEquals(1, dao.getAllPositions().size());

	}

	@Test
	public void addPositionReturnsCorrectJobTitle() {
		Position position = createPositionObject();
		dao.addPosition(position);
		Assert.assertTrue(dao.getAllPositions().get(0).getJobTitle().equals("Flipper"));
	}

	//Test for getAllPositions()
	@Test
	public void getAllPositionsReturnsCorrectNumberOfPositions() {
		insertPositionIntoDatabase();
		Assert.assertEquals(1, dao.getAllPositions().size());
	}
	
	//Test for getPositionsByEmployerId()
	@Test
	public void getAllPositionsByEmployerIdReturnsCorrectNumberOfPositions() {
		insertPositionIntoDatabase();
		Long employerId = (long) 1;
		Assert.assertEquals(1, dao.getPositionsByEmployerId(employerId).size());
	}

	// Test for getPositionByPositionId()
	@Test
	public void getPositionByPositionIdReturnsPositionObject() {
		Position position = createPositionObject();
		dao.addPosition(position);
		Long positionId = position.getPositionId();
		Assert.assertTrue(dao.getPositionByPositionId(positionId).getJobTitle().equals("Flipper"));
	}
	//Test for getAllVisiblePositions()
	@Test
	public void getAllVisiblePositionsReturnsCorrectNumberOfPositions() {
		Position position = createPositionObject();
		dao.addPosition(position);
		insertPositionIntoDatabase();
		Assert.assertEquals(1, dao.getAllVisiblePositions().size());
	}
	//Test for updatePosition() 
	@Test
	public void updatedPositionShouldSaveToDatabase() {
		Position position = createPositionObject();
		dao.addPosition(position);
		position.setJobTitle("Taco Maker");
		dao.updatePosition(position);
		long id = position.getPositionId();
		Assert.assertTrue(dao.getPositionByPositionId(id).getJobTitle().equals("Taco Maker"));
	}
	//Test for updateDisplayedCheckbox()
	@Test
	public void updateDisplayedValueForPositionByIdReturnsCorrectDisplay() {
		Position position = createPositionObject();
		dao.addPosition(position);
		position.setDisplayed(false);
		dao.updateDisplayedCheckbox(position.getPositionId(), position.getDisplayed());
		Assert.assertEquals(false, dao.getPositionByPositionId(position.getPositionId()).getDisplayed());
	}
	//getAllVisiblePositionsByRegion()
	@Test
	public void getAllPositionsByRegionReturnsCorrectNumber() {
		Position position = createPositionObject();
		dao.addPosition(position);
		insertPositionIntoDatabase();
		Assert.assertEquals(2, dao.getAllVisiblePositionsByRegion("Northwest").size());
	}

	// filter methonds testing for inputs on searchPositions.jsp and JDBCPostionDAO
	@Test
	public void getFilteredPositionsShouldReturnAPositionWithHealthBenefitsWhenFilterByHealthBenefitsIsChosen() {
		Position position = createPositionObject();
		dao.addPosition(position);
		insertPositionIntoDatabase();
		Assert.assertEquals(1, dao.getFilteredPositions("healthBenefits", "", "", "", "", "").size());
	}

	@Test
	public void getFilteredPositionsShouldReturnAPositionWithRetirementBenefitsWhenFilterByRetirementBenefitsIsChosen() {
		Position position = createPositionObject();
		dao.addPosition(position);
		insertPositionIntoDatabase();
		Assert.assertEquals(1, dao.getFilteredPositions("retirmentBenefits", "", "", "", "", "").size());
	}

	@Test
	public void getFilteredPositionsShouldReturnAPositionWithEducationBenefitsWhenFilterByEducationBenefitsIsChosen() {
		Position position = createPositionObject();
		dao.addPosition(position);
		insertPositionIntoDatabase();
		Assert.assertEquals(1, dao.getFilteredPositions("educationBenefits", "", "", "", "", "").size());
	}

	@Test
	public void getFilteredPositionsShouldReturnOnlyPositionWithAreaOfCityIsNorthwestWhenFilterFilterByAreaOfCityIsChosen() {
		Position position = createPositionObject();
		dao.addPosition(position);
		insertPositionIntoDatabase();
		Assert.assertEquals(1, dao.getFilteredPositions("", "Northwest", "", "", "", "").size());
	}

	@Test
	public void getFilteredPositionsShouldReturnPositionAsSeasonalWhenFilterByHourlyTypeIsChosen() {
		Position position = createPositionObject();
		dao.addPosition(position);
		insertPositionIntoDatabase();
		Assert.assertEquals(1, dao.getFilteredPositions("", "", "Full-Time", "", "", "").size());
	}
	
	@Test
	public void getFilteredPositionsShouldReturnPositionShiftAsSecondWhenFilterByShiftIsChosen() {
		Position position = createPositionObject();
		dao.addPosition(position);
		insertPositionIntoDatabase();
		Assert.assertEquals(1, dao.getFilteredPositions("", "", "", "2nd", "", "").size());
	}
	
	@Test
	public void getFilteredPositionsShouldReturnPositionHireTypeAsSeasonalWhenFilterByHourlyTypeIsChosen() {
		Position position = createPositionObject();
		dao.addPosition(position);
		insertPositionIntoDatabase();
		Assert.assertEquals(1, dao.getFilteredPositions("", "", "", "", "", "Seasonal").size());
	}
	//Test for updatePickUpLocation() 
	@Test
	public void updateLocationValueForPositionByIdUpdatedDatabaseCorrectly() {
		Position position = createPositionObject();
		dao.addPosition(position);
		position.setPickUpLocation("Test Location");
		dao.updatePickUpLocation(position.getPositionId(), position.getPickUpLocation());
		Position databasePosition = dao.getPositionByPositionId(position.getPositionId());

		Assert.assertTrue(databasePosition.getPickUpLocation().equals("Test Location"));
	}

	private Position createPositionObject() {
		Position position = new Position();
		Long employerId = (long) 1;
		position.setEmployerId(employerId);
		position.setJobTitle("Flipper");
		position.setJobDescription("Flip things");
		position.setHourlyRate("29.92");
		position.setHourlyType("Full-time");
		position.setHealthBenefits(true);
		position.setRetirementBenefits(true);
		position.setEducationBenefits(true);
		position.setHireType("Seasonal");
		position.setAreaOfCity("Northwest");
		position.setShift("2nd");
		position.setSecondChanceEmployer(true);
		position.setOtherComments("Here are other comments");

		return position;
	}

	private void insertPositionIntoDatabase() {
		String insertPositionSQL = "INSERT INTO position (position_id, job_title, job_description, hourly_rate, health_benefits, retirement_benefits, education_benefits, area_of_city, hourly_type, hire_type, employer_id, shift, displayed, second_chance_employer, other_comments) "
				+ "VALUES (NEXTVAL('position_position_id_seq'), 'THE JOB', 'Doing Stuff', '29.99', 'true', 'true', 'true', 'Northwest', 'full-time', 'seasonal', '1', '2nd', 'false', 'true', 'some other comments')";
		jdbcTemplate.update(insertPositionSQL);
	}

	private void insertEmployerIntoDatabase() {
		String insertEmployerSQL = "INSERT INTO employer (employer_id, company_name, street_Address1, street_Address2, city, state, zip_code) "
				+ "VALUES ('1', 'test company', '1234 GFTO lane', ' ', 'tacoland', 'OH', '43235')";
		jdbcTemplate.update(insertEmployerSQL);

	}

	private void clearPositionTable() {
		String truncatePositionTableSql = "TRUNCATE position CASCADE";
		jdbcTemplate.update(truncatePositionTableSql);
	}

	private void clearEmployerTable() {
		String truncateEmployerTableSql = "TRUNCATE employer CASCADE";
		jdbcTemplate.update(truncateEmployerTableSql);
	}
}
