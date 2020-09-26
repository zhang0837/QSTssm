package com.qst.service;

import java.util.List;

import com.qst.po.News;

public interface UserService {
	public List<News> getUserList();
	
	public void insertNews(News news);
	
	public void deleteNews(Integer id);

	public News getNewById(Integer id);

	public void updateNews(News news);

}
