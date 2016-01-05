package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.entity.Board;
import tw.com.softleader.e5e5.entity.BoardCategoria;
import tw.com.softleader.e5e5.entity.Chat;

public interface BoardDao extends JpaRepository<Board, Integer> {

	public List<Board> findByBoardCategoria(BoardCategoria boardCategoria);

	public Board findByName(String name);
	
	@Query(value ="select * from Board b where name is not null order by name desc", nativeQuery = true)
	public List<Board> findAllOrderByName();

	@Query(value ="select * from Board b where thread_count is not null order by thread_count desc", nativeQuery = true)
	public List<Board> findAllOrderByThreadCount();




}
