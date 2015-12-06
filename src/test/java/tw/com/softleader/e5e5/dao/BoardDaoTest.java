package tw.com.softleader.e5e5.dao;

import java.util.Date;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.Board;
import tw.com.softleader.e5e5.entity.BoardCategoria;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class BoardDaoTest {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private BoardDao boardDao;
	
	@Test
	public void testCrud() {
		Board board = new Board();
		board.setName("淡江大學");
		board.setCreatedDate(new Date());
		
		boardDao.save(board);
	
	}

}
