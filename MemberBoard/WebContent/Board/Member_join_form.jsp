<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
</head>
<body>
<button onClick="location.href='Login.jsp'">메인화면</button>
<div align="center">
<H2>회원가입</H2><HR>
<form name=form1 method=post action=Member_control.jsp>
<input type=hidden name="action" value="insert">
<table border="1">
  <tr>
    <th>ID</th>	<td><input type="text" name="m_id" maxlength="20"></td>
  </tr>
  <tr>
    <th>PW</th><td><input type="password" name="m_pw" maxlength="20"></td>
  </tr>
  <tr>
    <th>이 름</th><td><input type="text" name="m_name" maxlength="20"></td>
  </tr>
  <tr>
    <th>email</th><td><input type="email" name="m_email"></td>
  </tr>  
  <tr>
    <th>전화번호</th> <td><input type="text" name="m_tel"></td>
  </tr>
  <tr>
    <th>생년월일</th><td><input type="date" name="m_birth"></td>
  </tr>
  <tr>
 <td colspan=2 align=center><input type=submit value="저장"> <input type=reset value="취소"></td>
</tr>
</table>
</form>
</div>
</body>
</html>