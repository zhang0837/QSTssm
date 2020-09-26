<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻信息</title>
</head>
<body>
<table border=1>
<tr><td>编号</td><td>标题</td><td>内容</td><td>作者</td></tr>
<tr><td>${news.id}</td><td>${news.title}</td><td>${news.content}</td><td>${news.author}</td></tr>
</table>
</body>
</html>