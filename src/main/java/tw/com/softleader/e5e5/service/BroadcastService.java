package tw.com.softleader.e5e5.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.BroadcastDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.Broadcast;
import tw.com.softleader.e5e5.entity.Chat;
import tw.com.softleader.e5e5.entity.User;

@Service
public class BroadcastService {

	private BroadcastDao broadcastDao;
	private UserDao userDao;

	@Autowired
	public BroadcastService(BroadcastDao broadcastDao,UserDao userDao) {
		this.broadcastDao = broadcastDao;
		this.userDao = userDao;
	}

	@Transactional
	public List<Broadcast> getLastTenBroadcasts() {
		List<Broadcast> broadcasts = broadcastDao.findAllOrderByPostTime();
		return broadcasts;
	}

	@Transactional
	public Broadcast postBroadcast(int userId, String broadcastDescription) {
		Broadcast result = null;
		Broadcast broadcast = new Broadcast();
		User user = userDao.findOne(userId);

		broadcast.setBroadcastDescription(broadcastDescription);
		broadcast.setUser(user);
		broadcast.setPostTime(new Date());
		result = broadcastDao.save(broadcast);

		return result;
	}

}
