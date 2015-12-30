package tw.com.softleader.e5e5.common;

import org.junit.runner.RunWith;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import tw.com.softleader.e5e5.E5e5App;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
@WebAppConfiguration
public abstract class AbstractTest {

}
