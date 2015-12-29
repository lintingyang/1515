package tw.com.softleader.e5e5.common.ajax;


import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.collect.Iterables;
import com.google.common.collect.Lists;

import tw.com.softleader.e5e5.common.model.Message;

@SuppressWarnings("serial")
public class AjaxResponse<T> implements Iterator<Message>, Iterable<Message>, Serializable {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	
	private T data;
	private List<Message> messages = Lists.newArrayList();

	public AjaxResponse(final T data) {
		super();
		this.data = data;
	}

	public AjaxResponse(final Throwable t) {
		Preconditions.checkNotNull(t, "Throwable in AjaxResponse's constructor must not be null!");
		log.error(t.getMessage(), t);
		final String errorMessage = t.getMessage();
		// if (ExceptionUtils.isCausedBy(t, ApplicationException.class)) {
		// errorMessage = ExceptionUtils.analysis((SoftleaderException) t);
		// }
		this.messages = Lists.newArrayList(new Message(errorMessage));
	}

	public AjaxResponse(final Iterable<Message> messages) {
		super();
		Preconditions.checkNotNull(messages, "Messages in AjaxResponse's constructor must not be null!");
		this.messages = Lists.newArrayList(messages);
	}

	public AjaxResponse() {
		super();
	}

	public AjaxResponse(final T data, final Iterable<Message> messages) {
		super();
		this.data = data;
		Preconditions.checkNotNull(messages, "Messages in AjaxResponse's constructor must not be null!");
		this.messages = Lists.newArrayList(messages);
	}

	public T getData() {
		return data;
	}

	public void setData(final T data) {
		this.data = data;
	}

	public List<Message> getMessages() {
		return messages;
	}


	public void addException(final Throwable t) {
		final String errorMessage = t.getMessage();
		addMessages(new Message(errorMessage));
	}

	public void setMessages(final List<Message> messages) {
		Preconditions.checkNotNull(messages, "Messages must not be null!");
		this.messages = messages;
	}

	public AjaxResponse<T> addMessages(final Message... messages) {
		Preconditions.checkNotNull(messages, "Messages must not be null!");
		this.messages.addAll(Lists.newArrayList(messages));
		return this;
	}

	public AjaxResponse<T> addMessages(final Iterable<Message> messages) {
		Preconditions.checkNotNull(messages, "Messages must not be null!");
		this.messages.addAll(Lists.newArrayList(messages));
		return this;
	}

	public AjaxResponse<T> addMessage(final String message) {
		this.messages.add(new Message(message));
		return this;
	}

	public AjaxResponse<T> addMessage(final String name, final String message) {
		this.messages.add(new Message(name, message));
		return this;
	}

	public boolean isMessagesEmpty() {
		return Iterables.isEmpty(this);
	}

	public AjaxResponse<T> removeMessagesIf(final Predicate<? super Message> predicate) {
		Preconditions.checkNotNull(predicate, "Predicate must not be null!");
		Iterables.removeIf(this.messages, predicate);
		return this;
	}

	@Override
	public boolean hasNext() {
		return messages.iterator().hasNext();
	}

	@Override
	public Message next() {
		return messages.iterator().next();
	}

	@Override
	public void remove() {
		messages.iterator().remove();
	}

	@Override
	public Iterator<Message> iterator() {
		return messages.iterator();
	}

}