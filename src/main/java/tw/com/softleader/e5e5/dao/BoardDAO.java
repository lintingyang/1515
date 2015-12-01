package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.hibernate.Session;

import tw.com.softleader.e5e5.entity.Board;

public class BoardDAO {
	private Session session = null;

	public BoardDAO(Session session) {
		this.session = session;
	}

	public Session getSession() {
		return session;
	}

	public Board select(int boardId) {
		return (Board) this.getSession().get(Board.class, boardId);
	}

	public List<Board> select() {
		return this.getSession().createQuery("from boards").list();
	}

	public int insert(Board bean) {
		Board temp = (Board) this.getSession().get(Board.class, bean.getid());
		if (temp == null) {
			this.getSession().save(bean);
			return 1;
		}						
		return -1;
	}
	
	public int update(java.util.Date dateCreated , String boardName,byte[] boardPic,
			String bDescription,Integer threadCount,Integer replayCount,char isCream,Integer boardId){
		Board result = (Board) this.getSession().get(Board.class, boardId);
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
		Board bean = (Board) this.getSession().get(Board.class, boardId);
		if(bean != null){
			this.getSession().delete(bean);
			return true;
		}
		return false;
		
	}
}