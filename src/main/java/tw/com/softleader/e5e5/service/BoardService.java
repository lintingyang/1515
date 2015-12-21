package tw.com.softleader.e5e5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.BoardCategoriaDao;
import tw.com.softleader.e5e5.dao.BoardDao;
import tw.com.softleader.e5e5.entity.Board;
import tw.com.softleader.e5e5.entity.BoardCategoria;

@Service
public class BoardService {

	@Autowired
	private BoardDao boardDao;
	@Autowired
	private BoardCategoriaDao boardCategoriaDao;
	
	//依Id排序版面
	@Transactional
	public List<Board> getBoardById() {
		return boardDao.findAll();
	}
	//依名字排序版面
	@Transactional
	public List<Board> getBoardByName() {
		return boardDao.findAllOrderByName();
	}
	
	//依帖子數排序版面
	@Transactional
	public List<Board> getBoardByThreadCount() {
		return boardDao.findAllOrderByThreadCount();
	}
	
	//依boardCategoria搜尋版面
	@Transactional
	public List<Board> getBoardByBoardCategoria(BoardCategoria boardCategoria) {
		return boardDao.findByBoardCategoria(boardCategoria);
	}
	
	//依名字搜尋版面
	@Transactional
	public Board getBoardByName(String name) {
		return boardDao.findByName(name);
	}

	//依ID搜尋版面
	@Transactional
	public Board getBoardById(Integer id) {
		return boardDao.findOne(id);
	}
	//依帖子數搜尋
	@Transactional
	public List<Board> getBoardByThreadCount(String name) {
		return boardDao.findAllOrderByThreadCount();
	}
	//新增版
	@Transactional
	public int createBoard(BoardCategoria boardCategoria, String name, String description, String picture) {
		if (boardDao.findByName(name) == null) {
			Board board = new Board();
			board.setBoardCategoria(boardCategoria);
			board.setName(name);
			board.setIsCream('F');
			board.setIsHide('F');
			board.setThreadCount(0);
			board.setReplyCount(0);
			board.setCreatedDate(new java.util.Date());
			board.setDescription(description);
			board.setPicture(picture);
			boardDao.save(board);
		}
		return -1;
	}
	
	//設定隱藏版
	@Transactional
	public char hideBoard(Character ch) {
		Board board = new Board();
		if (ch == 'T') {
			board.setIsHide('T');
		}else if(ch == 'F'){
			board.setIsHide('F');
		}else{
			ch = 'E';
		}
		return ch;
	}

	//設定精華區
	@Transactional
	public char creamBoard(Character ch) {
		Board board = new Board();
		if (ch == 'T') {
			board.setIsCream('T');
		}else if(ch == 'F'){
			board.setIsCream('F');
		}else{
			ch = 'E';
		}
		return ch;
	}

}// end
