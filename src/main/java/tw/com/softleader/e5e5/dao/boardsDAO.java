package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.hibernate.Session;

import tw.com.softleader.e5e5.entity.boards;

public class boardsDAO {
	private Session session = null;

	public boardsDAO(Session session) {
		this.session = session;
	}

	public Session getSession() {
		return session;
	}

	public boards select(int boardId) {
		return (boards) this.getSession().get(boards.class, boardId);
	}

	public List<boards> select() {
		return this.getSession().createQuery("from boards").list();
	}

	public int insert(boards bean) {
		boards temp = (boards) this.getSession().get(boards.class, bean.getBoardId());
		if (temp == null) {
			this.getSession().save(bean);
			return 1;
		}						
		return -1;
	}
	
	public int update(java.util.Date dateCreated , String boardName,byte[] boardPic,
			String bDescription,Integer threadCount,Integer replayCount,char isCream,Integer boardId){
		boards result = (boards) this.getSession().get(boards.class, boardId);
		if (result!=null){
			result.setDateCreated(dateCreated);
			result.setBoardName(boardName);
			result.setBoardPic(boardPic);
			result.setbDescription(bDescription);
			result.setThreadCount(threadCount);
			result.setReplayCount(replayCount);
			result.setIsCream(isCream);
		}
		return -1;
	}
	
	public boolean delete(Integer boardId){
		boards bean = (boards) this.getSession().get(boards.class, boardId);
		if(bean != null){
			this.getSession().delete(bean);
			return true;
		}
		return false;
		
	}
}