package mysql;

import static org.junit.Assert.*;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.junit.Before;
import org.junit.Test;

public class DBBeanTest {
	
	private DBBean dbBean = new DBBean();

	@Before
	public void setUp() throws Exception {
		dbBean.setCon("bigproject"); // Connect to the database
	}

	// insert into an inexistent table
	@Test
	public void testInsert1() {
		boolean result = dbBean.insert("notable", "username, password, usertype", "'333', '333', '1'");
		assertFalse(result);
	}
	
	// insert into an existent table with correct values
	@Test
	public void testInsert2() {
		boolean result = dbBean.insert("users", "username, password, usertype", "'333', '333', '1'");
		assertTrue(result);
	}
	
	// insert into an existent table without required values
	@Test
	public void testInsert3() {
		boolean result = dbBean.insert("users", "username", "'333'");
		assertFalse(result);
	}

	// select from an inexistent table
	@Test
	public void testSelect1() throws SQLException {
		ResultSet resultSet = dbBean.select("notable", "name");
		assertFalse(resultSet != null);
	}
	
	// select from a existent table
	@Test
	public void testSelect2() throws SQLException {
		ResultSet resultSet = dbBean.select("users", "username", "WHERE USERNAME = '1'");
		assertTrue(resultSet != null);
	}

	@Test
	public void testUpdate() {
		boolean result = dbBean.update("users", "password", "2", "WHERE USERNAME = '1'");
		assertTrue(result);
	}


}
