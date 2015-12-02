package tw.com.softleader.e5e5;

import org.apache.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import tw.com.softleader.e5e5.service.CalculateService;

@SpringBootApplication
public class E5e5App {
	
	private static Logger log = Logger.getLogger(E5e5App.class);
	
	public static void main(final String[] args) {
		SpringApplication.run(E5e5App.class, args);
		
		log.error("Hello ERROR");
		log.warn("Hello Warn");
		log.info("Hello Info");
		log.debug("Hello Debug");
		
		int result = new CalculateService().sum(3, 5);
		
		log.info("result="+result);
		
	}

}
