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
	//依id搜尋
	@Transactional
	public BoardCategoria findById(Integer id) {
		return boardCategoriaDao.findOne(id);
	}
	//依名稱搜尋
	@Transactional
	public BoardCategoria findByName(String name) {
		BoardCategoria boardCategoria = boardCategoriaDao.findByName(name);
		if (boardCategoria != null) {
			return boardCategoria;
		}
		return null;
	}
	//新增版面類別
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
	//更新名稱
	public int updateCategoria(Integer id, String name) {
		if (boardCategoriaDao.findOne(id) != null) {
			BoardCategoria bc = boardCategoriaDao.findOne(id);
			bc.setName(name);
			boardCategoriaDao.save(bc);
			return 1;
		}
		return -1;
	}
}
