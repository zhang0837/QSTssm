package com.qst.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qst.po.Message;
import com.qst.po.News;
import com.qst.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	// @Autowired
	// private Message data;

	@ResponseBody
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public List<News> getAllNews() {
		List<News> userList = userService.getUserList();
		return userList;
	}

	@ResponseBody
	@RequestMapping(value = "/news", method = RequestMethod.POST)
	public Message addNews(News news) {
		userService.insertNews(news);
		Message msg = new Message();
		msg.setMsg("添加成功!!!");
		return msg;
	}
	
	@ResponseBody
	@RequestMapping(value = "/news/{id}", method = RequestMethod.DELETE)
	public Message deleteNews(@PathVariable("id") Integer id) {
		userService.deleteNews(id);
		Message msg = new Message();
		msg.setMsg("删除成功!!!");
		return msg;
	}
	@ResponseBody
	@RequestMapping(value="/news/{id}",method=RequestMethod.GET)
	public Message getNewById(@PathVariable("id") Integer id){
		News news = userService.getNewById(id);
		Message msg = new Message(news);
		return msg;
	}
	
	@ResponseBody
	@RequestMapping(value="/news",method=RequestMethod.PUT)
	public Message updataNews(News news){
		userService.updateNews(news);
		Message msg = new Message("更新成功！！！");
		return msg;
	}
}
