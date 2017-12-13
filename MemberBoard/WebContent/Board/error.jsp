<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<button onClick="location.href='Board_control.jsp?action=list'">게시글 </button> 
<button onClick="location.href='Login.jsp'">메인화면</button>
<div align ="center">
<h2>ERROR</h2>
<hr>
<table cellpadding=5 width=400>
<tr width=100% bgcolor="skyblue">
<td>게시판 처리중 에러가 발생 했습니다.<br>
에러내용 : <%=exception %>
<hr>
</td>
</tr>

</table>
</div>

</body>
</html>