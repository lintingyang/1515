package tw.com.softleader.e5e5.common.service;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.commons.collections4.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import tw.com.softleader.e5e5.common.dao.CommonCriterion;
import tw.com.softleader.e5e5.common.dao.CommonQueryPattern;
import tw.com.softleader.e5e5.common.dao.GenericDao;
import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.common.entity.GenericEntity;
import tw.com.softleader.e5e5.common.entity.OurEntity;
import tw.com.softleader.e5e5.common.entity.OurEntityPro;
import tw.com.softleader.e5e5.common.model.Message;

public abstract class OurServicePro<T extends OurEntityPro> {

	protected Logger log = LoggerFactory.getLogger(this.getClass());

	public abstract OurDao<T> getDao();

	protected abstract List<Message> validateInsert(final T entity);//abstraRct要實作

	protected abstract List<Message> validateUpdate(final T entity);

	protected abstract List<Message> validateDelete(final int id);

	public T getOne(final int id) {
		
		return getDao().findOne(id);
	}

	public List<T> getAll() {
		return getDao().findAll();
	}


	public Page<T> getAll(final Pageable pageable) {
		return getDao().findAll(pageable);
	}

	public Page<T> getByCondition(final List<CommonCriterion> criterions, final Pageable pageable) {
		return getDao().findAll(new CommonQueryPattern<T>(criterions), pageable);
	}

	public List<T> getByCondition(final List<CommonCriterion> criterions) {
		return getDao().findAll(new CommonQueryPattern<T>(criterions));
	}


	protected T handleInsert(final T entity) {
		return entity;
	}

	protected T handleUpdate(final T entity) {
		return entity;
	}

	@Transactional
	public T insert(T entity) {

		final List<Message> messages = validateInsert(entity);
		
		if (CollectionUtils.isEmpty(messages)) {
			entity = handleInsert(entity);
			final T insertedEntity = getDao().save(entity);
			afterInsert(insertedEntity);
			return insertedEntity;
		} else {
			throw new RuntimeException(messages.toString());
		}
	}

	@Transactional
	public List<T> insert(final List<T> entities) {
		for (final T entity : entities) {
			insert(entity);
		}
		return entities;
	}

	protected void afterInsert(final T insertedEntity) {

	}

	@Transactional
	public T update(T entity) {

		final List<Message> messages = validateUpdate(entity);

		if (CollectionUtils.isEmpty(messages)) {
			final T dbEntity = getOne(entity.getId());
			if (dbEntity == null) {
				throw new RuntimeException("cannot update non-exist record");
			}

			entity = handleUpdate(entity);

			BeanUtils.copyProperties(entity, dbEntity);
			log.debug("{}", dbEntity);
			return dbEntity;
		} else {
			throw new RuntimeException(messages.toString());
		}

	}

	@Transactional
	public List<T> update(final List<T> entities) {
		for (final T entity : entities) {
			update(entity);
		}
		return entities;
	}

	@Transactional
	public void delete(final int id) {
		final List<Message> messages = validateDelete(id);

		if (CollectionUtils.isEmpty(messages)) {
			getDao().delete(id);
		} else {
			throw new RuntimeException(messages.toString());
		}

	}

//	protected String getLoginUsername() {
//		return SecurityConfig.getLoginUsername();
//	}
}