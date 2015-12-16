package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.Admin;
import tw.com.softleader.e5e5.entity.BoardCategoria;

public interface AdminDao extends JpaRepository<Admin, Integer> {
	public List<Admin> findByName(String name);
	public Admin findByAccount(String account);
}
