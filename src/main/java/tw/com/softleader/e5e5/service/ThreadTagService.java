package tw.com.softleader.e5e5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.TagDao;
import tw.com.softleader.e5e5.dao.ThreadTagDao;
import tw.com.softleader.e5e5.entity.Tag;
import tw.com.softleader.e5e5.entity.ThreadTag;

@Service
public class ThreadTagService {
	@Autowired
	private ThreadTagDao threadTagDao;
	@Autowired
	private TagDao tagDao;

	@Transactional
	public List<ThreadTag> findByTagService(int tagId){
		Tag tagbean= this.tagDao.findOne(tagId);
		List<ThreadTag> list = this.threadTagDao.findByTag(tagbean);
		return list;
	}
	@Transactional
	public void findall(){
		List<ThreadTag> list = threadTagDao.findAll();
	}
}
	

