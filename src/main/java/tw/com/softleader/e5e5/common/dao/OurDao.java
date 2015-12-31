package tw.com.softleader.e5e5.common.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface OurDao<T> extends JpaRepository<T, Integer>, JpaSpecificationExecutor<T> {
	
}
