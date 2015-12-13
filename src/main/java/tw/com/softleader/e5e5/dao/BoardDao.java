package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.Admin;
import tw.com.softleader.e5e5.entity.Board;
import tw.com.softleader.e5e5.entity.BoardCategoria;

public interface BoardDao extends JpaRepository<Board, Integer> {

	List<Board> findByBoardCategoria(BoardCategoria boardCategoria);



}
