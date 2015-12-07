package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.BoardCategory;

public interface BoardCategoryDao extends JpaRepository<BoardCategory, Integer>{

	public List<BoardCategory> findByName(String name);

}
