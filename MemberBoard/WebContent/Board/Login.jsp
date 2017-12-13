<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOGIN</title>
<% request.setCharacterEncoding("utf-8"); %>
</head>
<body>
<%
 if(session.getAttribute("m_id")==null){%>
 <button onClick="location.href='Member_join_form.jsp'">회원가입</button>
 <div align=center>
	 <h1>LOGIN</h1> 
	 <form action="Login_check.jsp" method="post">
	 <table>
	 <tr>
	 <th>ID</th><td><input name="m_id" type="text"/></td>
	 </tr>
	 <tr>
	 <th>PW</th><td><input name="m_pw" type="password"/></td>
	 </tr>
	 <tr>
	 <td colspan="2" align=center><input type="submit" value="로그인"> <input type="reset" value="취소"></td>
	 </table>
	 </form>
	 </div>
	 <%
 }
 else{%>
	 <button onClick="location.href='Board_control.jsp?action=list'">게시글 </button> 
	 <button onClick="location.href='Board_control.jsp?action=mylist'">내가 쓴 게시글 </button> 
	 <button onClick="location.href='Member_Info.jsp'">내 정보</button>
	 <div align=center> 
	 <form action="Logout.jsp" method="post">
	 <h1>MAIN</h1> 
	 <% 
	 out.print(session.getAttribute("m_id")+" 님 환영합니다.");%>
	 <button> LOGOUT </button> 
	 </form>
	 <hr>
	 <% 
 }
%>
 </div>
</body>
</html>