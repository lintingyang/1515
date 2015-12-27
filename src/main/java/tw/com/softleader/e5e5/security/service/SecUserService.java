package tw.com.softleader.e5e5.security.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.common.dao.CommonCriterion;
import tw.com.softleader.e5e5.common.dao.GenericDao;
import tw.com.softleader.e5e5.common.dao.QueryOpType;
import tw.com.softleader.e5e5.common.model.Message;
import tw.com.softleader.e5e5.common.service.GenericService;
import tw.com.softleader.e5e5.security.dao.SecUserDao;
import tw.com.softleader.e5e5.security.entity.SecUser;

public class SecUserService  extends GenericService<SecUser> {

	@Autowired
	private SecUserDao secUserDao;
	
	@Override
	public GenericDao<SecUser> getDao() {
		return secUserDao;
	}

	@Override
	protected List<Message> validateInsert(SecUser entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateUpdate(SecUser entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateDelete(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
