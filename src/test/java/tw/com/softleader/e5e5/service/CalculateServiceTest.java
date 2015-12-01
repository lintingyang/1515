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

	@Test 
	public void testMin() {
		CalculateService cal = new CalculateService();
		int min = cal.min(3, 2);
		assertEquals(1, min);
	}
	
	@Test
	public void testDiv(){
	CalculateService cal = new CalculateService();
	int div = cal.div(6, 3);
	assertEquals(2, div);
	}

	@Test
	public void tesSub() {
		CalculateService cal = new CalculateService();
		int sub = cal.sub(8, 3);
		assertEquals(5, sub);
	}

}
