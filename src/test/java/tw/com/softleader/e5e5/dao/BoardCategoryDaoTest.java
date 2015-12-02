package tw.com.softleader.e5e5.dao;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.BoardCategory;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class BoardCategoryDaoTest {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private BoardCategoryDao boardCategoryDao;
	
	@Test
	public void testCrud() {
		BoardCategory boardCategory = new BoardCategory();
		boardCategory.setCreatedDate(new Date());
		boardCategory.setName("xyz");
		
		boardCategoryDao.save(boardCategory);
		
		BoardCategory dbEntity = boardCategoryDao.findOne(1);
		log.debug(dbEntity);
		
		List<BoardCategory> boardCategories = boardCategoryDao.findByName("xyz");
		
		for(BoardCategory b:boardCategories) {
			log.debug(b);
		}
		
		
		
	}

}
