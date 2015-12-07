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
import tw.com.softleader.e5e5.entity.BoardCategoria;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = { E5e5App.class })
public class BoardCategoriaDaoTest {

	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private BoardCategoriaDao boardCategoriaDao;

	@Test
	public void testCrud() {
		BoardCategoria boardCategoria = new BoardCategoria();
		boardCategoria.setCreatedDate(new Date());
		boardCategoria.setName("East-area");

		boardCategoriaDao.save(boardCategoria);
		
		BoardCategoria dbEntity = boardCategoriaDao.findOne(1);
		log.debug(dbEntity);

		List<BoardCategoria> boardCategories = boardCategoriaDao.findByName("North-area");

		for (BoardCategoria b : boardCategories) {
			log.debug(b);
		}
	}
}
