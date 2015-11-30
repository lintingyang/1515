package e517.bean;

import java.util.List;

public interface ExchangeDAO {

	public abstract Exchange select(int exchangeId);

	public abstract List<Exchange> select();

	public abstract int insert(Exchange bean);

	public abstract int update(Exchange bean);

	public abstract boolean delete(int exchangeId);

	
}
