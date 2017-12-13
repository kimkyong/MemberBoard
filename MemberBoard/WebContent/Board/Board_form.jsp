<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 작성</title>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
</head>
<body>
<button onClick="location.href='Board_control.jsp?action=list'">게시글 </button> 
<button onClick="location.href='Login.jsp'">메인화면</button>
<div align="center">
<H2>게시물 작성 </H2>
<% 
	 out.print(session.getAttribute("m_id")+" 님 접속중입니다.");%>
<HR>
<form name=form1 method=post action=Board_control.jsp>
<input type=hidden name="action" value="insert">
<input type=hidden name="b_userid" value="<%out.print(session.getAttribute("m_id")); %>">
<table border="1">
  <tr>
    <th>제목</th>	
    <td  width="500"><input style="width:500px;" type="text" name="b_title" maxlength="100"></td>
  </tr>
  <tr>
    <th>작성자</th><td><%out.print(session.getAttribute("m_id")); %></td>
  </tr>
  <tr>
    <th>내 용</th>
    <td width="500"><input style="width:500px; height:500px"type="text" width="500" name="b_content" maxlength="2000"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"> <input type=reset value="취소"></td>
</tr>
</table>
</form>
</div>
</body>
</html>