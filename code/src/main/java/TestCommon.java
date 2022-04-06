import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestCommon {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test_a_GetDabaseUrl() {
	        assertEquals("jdbc:mysql://ee417-db.cvmof7us33ml.eu-west-1.rds.amazonaws.com:3306/", Common.getDatabaseUrl());
	}
	
	@Test
	public void test_b_getDatabaseName() {
	        assertEquals("library", Common.getDatabaseName());
	}
	
	@Test
	public void test_c_getDatabaseUser() {
	        assertEquals("admin", Common.getDatabaseUser());
	}
	
	@Test
	public void test_d_getDatabasePassword() {
	        assertEquals("ee417groupg", Common.getDatabasePassword());
	}
	
	@Test
	public void test_e_getDatabaseUrlAndName() {
	        assertEquals("jdbc:mysql://ee417-db.cvmof7us33ml.eu-west-1.rds.amazonaws.com:3306/library", Common.getDatabaseUrlAndName());
	}
	
	@Test
	public void test_f_setDatabaseUrl() {
			Common.setDatabaseUrl("test");
	        assertEquals("test", Common.getDatabaseUrl());
	}
	
	@Test
	public void test_g_setDatabaseName() {
			Common.setDatabaseName("test");
	        assertEquals("test", Common.getDatabaseName());
	}
	
	@Test
	public void test_h_setDatabaseUser() {
			Common.setDatabaseUser("test");
	        assertEquals("test", Common.getDatabaseUser());
	}
	
	@Test
	public void test_i_setDatabasePassword() {
			Common.setDatabasePassword("test");
	        assertEquals("test", Common.getDatabasePassword());
	}
	

}
