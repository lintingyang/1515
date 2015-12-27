package tw.com.softleader.e5e5.common.dao;

import java.util.List;

public class CommonCriterion {
	
	private QueryOpType op;

	private String field;

	private Object value;

	private List<CommonCriterion> orCriterions;
	
	private String distinctProperty;


	public CommonCriterion(final QueryOpType op, final String field, final Object value) {
		this.op = op;
		this.field = field;
		this.value = value;
	}

	public CommonCriterion(final List<CommonCriterion> orCriterions) {
		this.orCriterions = orCriterions;
	}



	public QueryOpType getOp() {
		return op;
	}

	public void setOp(final QueryOpType op) {
		this.op = op;
	}

	public String getField() {
		return field;
	}

	public void setField(final String field) {
		this.field = field;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(final Object value) {
		this.value = value;
	}

	public List<CommonCriterion> getOrCriterions() {
		return orCriterions;
	}

	public void setOrCriterions(final List<CommonCriterion> orCriterions) {
		this.orCriterions = orCriterions;
	}

	public String getDistinctProperty() {
		return distinctProperty;
	}

	public void setDistinctProperty(String distinctProperty) {
		this.distinctProperty = distinctProperty;
	}


}