package tw.com.softleader.e5e5.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.e5e5.dao.ForumPictureDao;
import tw.com.softleader.e5e5.entity.ForumPicture;
import tw.com.softleader.e5e5.entity.Reply;

@Service
public class ForumPictureService {

	@Autowired
	private ForumPictureDao forumPictureDao;
	
	public void insertThread(String picture,tw.com.softleader.e5e5.entity.Thread fThread){
		ForumPicture forumPicture = new ForumPicture();
		forumPicture.setPicture(picture);
		forumPicture.setThread(fThread);
		forumPictureDao.save(forumPicture);
	}
	
	public void insertReply(String picture,Reply reply){
		ForumPicture forumPicture = new ForumPicture();
		forumPicture.setPicture(picture);
		forumPicture.setReply(reply);
		forumPictureDao.save(forumPicture);
	}
}
