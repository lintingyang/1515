package tw.com.softleader.e5e5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.BoardCategoriaDao;
import tw.com.softleader.e5e5.entity.BoardCategoria;

@Service
public class BoardCategoriaService {

	@Autowired
	private BoardCategoriaDao boardCategoriaDao;

	@Transactional
	public List<BoardCategoria> getAll() {
		return boardCategoriaDao.findAll();
	}
	
	@Transactional
	public BoardCategoria findById(Integer id){
		return boardCategoriaDao.findOne(id);
	}

	@Transactional
	public BoardCategoria findByName(String name) {
		BoardCategoria boardCategoria = boardCategoriaDao.findByName(name);
		if (boardCategoria != null) {
			return boardCategoria;
		}
		return null;
	}

	@Transactional
	public int createBoardCategoria(String name) {
		if (boardCategoriaDao.findByName(name) == null) {
			BoardCategoria bc = new BoardCategoria();
			bc.setName(name);
			bc.setCreatedDate(new java.util.Date());
			boardCategoriaDao.save(bc);
			return 1;
		}
		return -1;
	}
}
