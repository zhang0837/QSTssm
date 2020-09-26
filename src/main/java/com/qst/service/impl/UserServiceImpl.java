package com.qst.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qst.mapper.UserMapper;
import com.qst.po.News;
import com.qst.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	public UserMapper userMapper;

	public List<News> getUserList() {
		List<News> userList = userMapper.getUserList(null);
		return userList;
	}

	@Override
	public void insertNews(News news) {
		userMapper.insertNews(news);
	}

	public void deleteNews(Integer id) {
		userMapper.deleteNewsById(id);
	}

	public News getNewById(Integer id) {
		List<News> newsList = userMapper.getUserList(id);
		if (newsList.size() > 0) {
			return newsList.get(0);
		} else {
			return null;
		}
	}

	@Override
	public void updateNews(News news) {
		// TODO Auto-generated method stub
		userMapper.updateNews(news);
	}



	/*
	 * public void saveUser(User user) { //���ݼ��������һ��ID+1������һ���µ�ID int
	 * id=userList.get(userList.size()-1).getId()+1; user.setId(id);
	 * userList.add(user); }
	 * 
	 * public void deleteUserById(int id) { for (User user : userList) {
	 * if(user.getId()==id) { userList.remove(user); } } for(int
	 * i=0;i<userList.size();i++) { User user=userList.get(i);
	 * if(user.getId()==id) { userList.remove(user); } } }
	 * 
	 * public void updateUser(User currentUser) { for (int
	 * i=0;i<userList.size();i++) { User user=userList.get(i);
	 * if(currentUser.getId()==user.getId()) { userList.remove(user);
	 * userList.add(currentUser); break; } } }
	 * 
	 * public List<User> getUserList() { return userList; }
	 */
}
