package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.BoardCategoria;

public interface BoardCategoriaDao extends JpaRepository<BoardCategoria, Integer>{

	public BoardCategoria findByName(String name);

	
}
