package tw.com.softleader.e5e5.common.model;

import java.io.Serializable;


@SuppressWarnings("serial")
public class Message implements Serializable {

	private String name;
	private String value;
	
	public Message() {
	}
	
	public Message(String value) {
		this.value = value;
	}
	
	public Message(String name, String value) {
		this.name = name;
		this.value = value;
	}
	 
	@Override
	public String toString() {
		return "Message [name=" + name + ", value=" + value + "]";
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	
	
}
