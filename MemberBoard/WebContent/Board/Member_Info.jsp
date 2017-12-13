<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" import="jspbook.board.Member" import="jspbook.board.MemberBean"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보</title>
</head>

<body>
<button onClick="location.href='Board_control.jsp?action=list'">게시글 </button> 
<button onClick="location.href='Login.jsp'">메인화면</button>
<%
	String userid=(String)session.getAttribute("m_id");
	Member member =new MemberBean().getDB(userid);
%>
<div align="center">
<H2>내 정보 </H2><HR>
<input type=hidden name="m_id" value="<%=userid%>">
<table border="1">
  <tr>
    <th>ID</th>	<td width="300"><%=userid %></td>
  </tr>
  <tr>
    <th>PW</th><td><%=member.getM_pw() %></td>
  </tr>
  <tr>
    <th>이 름</th><td><%=member.getM_name() %></td>
  </tr>
  <tr>
    <th>email</th><td><%=member.getM_email() %></td>
  </tr>  
  <tr>
    <th>전화번호</th><td><%=member.getM_tel() %></td>
  </tr>
  <tr>
    <th>생년월일</th><td><%=member.getM_birth() %></td>
  </tr>
  <tr>
    <td colspan=2 align=center><button onClick="location.href='Member_update.jsp'">내 정보 수정</button></td>
</tr>
</table>
</div>
</body>
</html>