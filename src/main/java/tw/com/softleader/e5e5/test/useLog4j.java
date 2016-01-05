package tw.com.softleader.e5e5.test;

import org.apache.log4j.BasicConfigurator;
import org.jboss.logging.Logger;

public class useLog4j {
	//call Logger
	private static Logger log = Logger.getLogger(useLog4j.class);
	
	public static void main(String[] args){
		//BasicConfigurator:快速呼叫預設的設定
		//預設print to console
		BasicConfigurator.configure();
		
		//logger leve = FATAL > ERROR > WARN > INFO > DEBUG
		log.info("this is an info message");
		//[2015-12-31 09:44:55,700] INFO   (useLog4j.java:main:15) - this is an info message
		//0 [main] INFO tw.com.softleader.e5e5.test.useLog4j  - this is an info message
		//輸出格式也可以從log4j.properties的layout.ConversionPattern控制
		
		log.debug("this is an debug message");
	}
	
}
