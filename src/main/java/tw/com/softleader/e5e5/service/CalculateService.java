package tw.com.softleader.e5e5.service;

import org.apache.log4j.Logger;

public class CalculateService {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	public int sum(int a, int b) {
		log.debug("a="+a+", b="+b);
		
		
		return a+b;
	}
	public int mut(int a ,int b){
		return a*b;
	}
	public int sub(int a, int b) {
		return a-b;
	}



	public int min (int a, int b){
		return a-b;
	}
	public int div (int a, int b){
		if(b==0){
			System.out.println("b不可以為零");
			return -1;
		}
		return a/b;

	}

}
