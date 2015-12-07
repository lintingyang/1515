package tw.com.softleader.e5e5.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.Admin;
import tw.com.softleader.e5e5.entity.Board;

public interface BoardDao extends JpaRepository<Board, Integer> {


}
