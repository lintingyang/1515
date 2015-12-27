package tw.com.softleader.e5e5.common.ajax;


import java.io.Serializable;
import java.util.Collection;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import com.google.common.collect.Iterables;
import com.google.common.collect.Lists;

import tw.com.softleader.e5e5.common.model.Message;

@SuppressWarnings("serial")
public class GridResponse<T extends Serializable> extends AjaxResponse<Collection<T>> {

	public GridResponse() {
		super();
	}

	public <F> GridResponse(final Page<F> originalPage, final Pageable pageable, final Function<F, T> function) {
		super();
		Preconditions.checkNotNull(originalPage, "OriginalPage in GridResponse's constructor must not be null!");
		Preconditions.checkNotNull(pageable, "Pageable in GridResponse's constructor must not be null!");
		Preconditions.checkNotNull(function, "Function in GridResponse's constructor must not be null!");

		final Page<T> page = new PageImpl<>(Lists.transform(originalPage.getContent(), function), pageable, originalPage.getTotalElements());
		super.setData(page.getContent());
		this.pageAt = page.getNumber();
		this.totalElements = page.getTotalElements();
		this.totalPages = page.getTotalPages();
	}

	public GridResponse(final Page<T> page) {
		super();
		Preconditions.checkNotNull(page, "Page in GridResponse's constructor must not be null!");
		super.setData(page.getContent());
		this.pageAt = page.getNumber();
		this.totalElements = page.getTotalElements();
		this.totalPages = page.getTotalPages();
	}

	public GridResponse(final Page<T> page, final Iterable<Message> messages) {
		this(page);
		Preconditions.checkNotNull(messages, "Messages in GridResponse's constructor must not be null!");
		setMessages(Lists.newArrayList(messages));
	}

	public GridResponse(final Collection<T> allInOnePage) {
		Preconditions.checkNotNull(allInOnePage, "AllInOnePage in GridResponse's constructor must not be null!");
		super.setData(allInOnePage);
	}

	public <F> GridResponse(final Collection<F> origAllInOnePage, final Function<F, T> function) {
		Preconditions.checkNotNull(origAllInOnePage, "OrigAllInOnePage in GridResponse's constructor must not be null!");
		Preconditions.checkNotNull(function, "Function in GridResponse's constructor must not be null!");
		super.setData(Lists.newArrayList(Iterables.transform(origAllInOnePage, function)));
	}

	public GridResponse(final Iterable<Message> messages) {
		super(messages);
	}

	public GridResponse(final Throwable t) {
		super(t);
	}

	private long totalElements = 0;

	private int pageAt = 0;

	private long totalPages = 1;

	// @Override
	// public String toString() {
	// return StringUtils.toString(this);
	// }

	public long getTotalElements() {
		return totalElements;
	}

	public void setTotalElements(final long totalElements) {
		this.totalElements = totalElements;
	}

	public int getPageAt() {
		return pageAt;
	}

	public void setPageAt(final int pageAt) {
		this.pageAt = pageAt;
	}

	public long getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(final long totalPages) {
		this.totalPages = totalPages;
	}

}

