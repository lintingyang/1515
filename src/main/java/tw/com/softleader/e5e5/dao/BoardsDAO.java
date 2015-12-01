package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.hibernate.Session;

import tw.com.softleader.e5e5.entity.Boards;

public class BoardsDAO {
	private Session session = null;

	public BoardsDAO(Session session) {
		this.session = session;
	}

	public Session getSession() {
		return session;
	}

	public Boards select(int boardId) {
		return (Boards) this.getSession().get(Boards.class, boardId);
	}

	public List<Boards> select() {
		return this.getSession().createQuery("from boards").list();
	}

	public int insert(Boards bean) {
		Boards temp = (Boards) this.getSession().get(Boards.class, bean.getBoardId());
		if (temp == null) {
			this.getSession().save(bean);
			return 1;
		}						
		return -1;
	}
	
	public int update(java.util.Date dateCreated , String boardName,byte[] boardPic,
			String bDescription,Integer threadCount,Integer replayCount,char isCream,Integer boardId){
		Boards result = (Boards) this.getSession().get(Boards.class, boardId);
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
		Boards bean = (Boards) this.getSession().get(Boards.class, boardId);
		if(bean != null){
			this.getSession().delete(bean);
			return true;
		}
		return false;
		
	}
}