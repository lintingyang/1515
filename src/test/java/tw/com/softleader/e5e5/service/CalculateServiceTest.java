package tw.com.softleader.e5e5.service;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class CalculateServiceTest {

	@Test
	public void testSum() {
		
		CalculateService cal = new CalculateService();
		int sum = cal.sum(2, 3);
		assertEquals(5, sum);
		
	}
	
	@Test
	public void testMut() {
		CalculateService cal = new CalculateService();
		int mut = cal.mut(2, 3);
		cal.mut(2, 3);
		assertEquals(6, mut);
	}
	
	

}
