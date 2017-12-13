<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" errorPage="error.jsp" import="java.util.*, jspbook.board.*"%>
 <jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>
<button onClick="location.href='Board_control.jsp?action=list'">게시글 </button> 
<button onClick="location.href='Login.jsp'">메인화면</button>
<div align="center">
<h2>게시판</h2><% out.print(session.getAttribute("m_id")+" 님 접속중입니다.");%>
<hr>
<table border="1">
<tr><th>번호</th><th  width="500">제목</th><th>작성자</th><th>작성일</th></tr>
<% for(Board b:(ArrayList<Board>)datas){ %>
<tr>
<td><a href="Comment_control.jsp?action=list&c_b_num=<%=b.getB_num()%>"><%=b.getB_num() %></a></td>
<td><%=b.getB_title() %></td>
<td><%=b.getB_userid() %></td>
<td><%=b.getB_date() %></td>
</tr>
<%} %>
</table>
<br>
<button onClick="location.href='Board_form.jsp'">게시글 작성</button>
</div>
</body>
</html>