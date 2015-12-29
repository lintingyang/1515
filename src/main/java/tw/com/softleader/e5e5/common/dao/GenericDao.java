package tw.com.softleader.e5e5.common.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface GenericDao<T> extends JpaRepository<T, Long>, JpaSpecificationExecutor<T> {

}
