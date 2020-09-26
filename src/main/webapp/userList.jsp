<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表页面</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH }/js/jquery-3.2.1.js"></script>


</head>
<body>
	<input type="button" value="添加用户界面" onclick="showAddUserWindow()" />
	<input type="button" value="编辑用户界面" onclick="showEditUserWindow()" />
	<hr />
	<form>
		<table border="1">
			<thead>
				<tr>
					<th>选择</th>
					<th>ID</th>
					<th>标题</th>
					<th>内容</th>
					<th>作者</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="userList"></tbody>
		</table>
	</form>
	<hr />
	<div id="addUserDiv" style="display: none">
		<form id="addUserForm">
			<table>
				<caption>添加用户界面</caption>
				<tr>
					<td>标题</td>
					<td><input type="text" name="title" value="23"></td>
				</tr>
				<tr>
					<td>内容</td>
					<td><input type="text" name="content" value="23"></td>
				</tr>
				<tr>
					<td>作者</td>
					<td><input type="text" name="author" value="23"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="添加用户" id="addUser"></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="editUserDiv" style="display: none">
		<form id="editUserForm">
			<table>
				<caption>编辑用户界面</caption>
				<tr>
					<td>ID</td>
					<td><input type="text" name="id" id="id" readonly
						style="background: lightgray"></td>
				</tr>
				<tr>
					<td>标题</td>
					<td><input type="text" name="title" id="title"></td>
				</tr>
				<tr>
					<td>内容</td>
					<td><input type="text" name="content" id="content"></td>
				</tr>
				<tr>
					<td>作者</td>
					<td><input type="text" name="author" id="author"></td>
				</tr>
				<tr>
                    <td colspan="2"><input type="button" value="更新用户" id="editUser"></td>
                </tr>
			</table>
		</form>
	</div>

	<script>
		$(function() {
			getUserList();
		});
		function getUserList() {
			$("#userList").empty();
			$
					.ajax({
						url : "${APP_PATH}/news",
						type : "GET",
						dataType : "json",
						success : function(data) {
							$
									.each(
											data,
											function(index, user) {
												var userRow = $("<tr></tr>");
												var selectCell = $("<td><input type='checkbox' value='"+user.id+"'/></td>")
												var idCell = $("<td></td>")
														.append(user.id);
												var userNameCell = $(
														"<td></td>").append(
														user.title);
												var userPwdCell = $("<td></td>")
														.append(user.content);
												var ageCell = $("<td></td>")
														.append(user.author);
												var editButton = $(
														"<input type='button' value='编辑' class='editClass'/>")
														.attr("edit-id",
																user.id);
												var deleteButton = $(
														"<input type='button' value='删除' class='deleteClass'/>")
														.attr("edit-id",
																user.id);
												var opCell = $("<td></td>")
														.append(editButton)
														.append(deleteButton);
												userRow.append(selectCell)
														.append(idCell).append(
																userNameCell)
														.append(userPwdCell)
														.append(ageCell)
														.append(opCell);
												$("#userList").append(userRow);

											});

						}
					});
		}
		$(document).on("click", ".deleteClass", function() {
			var userId = $(this).attr("edit-id");
			$.ajax({
				url : "${APP_PATH}/news/" + userId,
				type : "DELETE",
				dataType : "json",
				success : function(data) {
					alert(data.msg);
					getUserList();
				}
			});
		});
		$(document).on(
				"click",
				".editClass",
				function() {
					var userId = $(this).attr("edit-id");
					//取消所有的复选框
					$(this).parents("table").find("input[type=checkbox]").prop(
							"checked", false);
					//选中当前行的复选框
					$(this).parents("tr").find("input").prop("checked", true);
					$.ajax({
						url : "${APP_PATH}/news/" + userId,
						type : "GET",
						dataType : "json",
						success : function(data) {
							$("#addUserDiv").css("display", "none");
							$("#editUserDiv").css("display", "block");

							$("#id").val(data.news.id);
							$("#title").val(data.news.title);
							$("#content").val(data.news.content);
							$("#author").val(data.news.author);
						}
					});
				});
		$("#addUser").click(function() {
			$.ajax({
				url : "${APP_PATH}/news/",
				type : "POST",
				data : $("#addUserForm").serialize(),//此处不是JSON数据，在Controller中不能使用@RequestBody进行转换
				success : function(data) {
					alert(data.msg);
					getUserList();
				}
			});
		});
		$("#editUser").click(function() {
			$.ajax({
				url : "${APP_PATH}/news/",
				type : "PUT",
				data : $("#editUserForm").serialize(),
				success : function(data) {
					alert(data.msg);
					getUserList();
				}
			});
		});

		function showAddUserWindow() {
			if ($("#addUserDiv").css("display") == "none") {
				$("#addUserDiv").css("display", "block");
			} else {
				$("#addUserDiv").css("display", "none");
			}
			$("#editUserDiv").css("display", "none");
		}
		function showEditUserWindow() {
			if ($("#editUserDiv").css("display") == "none") {
				$("#editUserDiv").css("display", "block");
			} else {
				$("#editUserDiv").css("display", "none");
			}
			$("#addUserDiv").css("display", "none");
		}
	</script>
</body>
</html>