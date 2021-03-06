package tw.com.softleader.e5e5.security.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.e5e5.common.dao.GenericDao;
import tw.com.softleader.e5e5.common.model.Message;
import tw.com.softleader.e5e5.common.service.GenericService;
import tw.com.softleader.e5e5.security.dao.SecRoleDao;
import tw.com.softleader.e5e5.security.entity.SecRole;

@Service
public class SecRoleService extends GenericService<SecRole> {

	@Autowired
	private SecRoleDao secRoleDao;
	
	@Override
	public GenericDao<SecRole> getDao() {
		return secRoleDao;
	}

	@Override
	protected List<Message> validateInsert(SecRole entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateUpdate(SecRole entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateDelete(Long id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	protected SecRole handleUpdate(SecRole form) {
		
		SecRole dbEntity = secRoleDao.findOne(form.getId());
		
		BeanUtils.copyProperties(form, dbEntity, new String[] {"code"} );
		
		return dbEntity;
		
	}

}
