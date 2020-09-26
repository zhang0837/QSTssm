package com.qst.po;

public class Message {
	private String msg;
	private News news;

	public Message() {
		super();
	}

	public Message(String msg) {
		this.msg = msg;
	}
	
	public Message(News news){
		this.news=news;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

}
