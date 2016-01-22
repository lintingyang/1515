package tw.com.softleader.e5e5;

import org.apache.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;

@SpringBootApplication
public class E5e5App extends SpringBootServletInitializer {

	private static Logger log = Logger.getLogger(E5e5App.class);

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(E5e5App.class);
	}

	public static void main(String[] args) throws Exception {
		SpringApplication.run(E5e5App.class, args);
		log.error("start up success!!!");
	}

}
