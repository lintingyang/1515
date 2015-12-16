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

	private ThreadTagDao threadTagDao;
	private TagDao tagDao;
	@Autowired
	public ThreadTagService(ThreadTagDao threadTagDao,TagDao tagDao){
		this.threadTagDao = threadTagDao;
		this.tagDao = tagDao;
	}
	@Transactional
	public List<ThreadTag> findByTagService(int tagId){
		Tag tagbean= this.tagDao.findOne(tagId);
		List<ThreadTag> list = this.threadTagDao.findByTag(tagbean);
		return list;
	}
}
	

