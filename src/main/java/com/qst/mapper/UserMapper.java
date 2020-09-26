package com.qst.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qst.po.News;

public interface UserMapper {

	public List<News> getUserList(@Param("id") Integer id);

	public void insertNews(News news);

	public void deleteNewsById(Integer id);

	public void updateNews(News news);
}
