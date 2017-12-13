<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" import="java.sql.*" 
    import="jspbook.board.Member" import="jspbook.board.MemberBean"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<% request.setCharacterEncoding("utf-8"); %>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<jsp:useBean id="m" scope="request" class="jspbook.board.Member"/> 
<jsp:setProperty name="member" property="*"/> 
<script type="text/javascript">
	function delcheck() {
		result = confirm("정말로 삭제하시겠습니까 ?");
	
		if(result == true){
			document.form1.action.value="delete";
			document.form1.submit();
		}
		else
			return;
	}
</script>
</head>


<body>
<button onClick="location.href='Board_control.jsp?action=list'">게시글 </button> 
<button onClick="location.href='Login.jsp'">메인화면</button>
<%
	String userid=(String)session.getAttribute("m_id");
	Member member =new MemberBean().getDB(userid);

%>
<div align="center">
<H2>정보수정</H2>
<HR>
<form name=form1 method=post action=Member_control.jsp>
<input type=hidden name="action" value="update">
<input type=hidden name="m_id" value="<%=userid %>">

<table border="1">
  <tr>
    <th>ID</th>	
    <td width="300"><%=userid %></td>
  </tr>
  <tr>
    <th>PW</th>
    <td><input style="width:300px;" type="text" name="m_pw" value="<%=member.getM_pw() %>" maxlength="20"></td>
  </tr>
  <tr>
    <th>이 름</th>
    <td><input style="width:300px;" type="text" name="m_name" value="<%=member.getM_name() %>" maxlength="20"></td>
  </tr>
  <tr>
    <th>email</th>
    <td><input style="width:300px;"  type="email" name="m_email" value="<%=member.getM_email() %>" ></td>
  </tr>  
  <tr>
    <th>전화번호</th>
    <td><input style="width:300px;"  type="text" name="m_tel" value="<%=member.getM_tel() %>"></td>
  </tr>
  <tr>
    <th>생년월일</th>
    <td><input style="width:300px;" type="date" name="m_birth" value="<%=member.getM_birth() %>"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"> <input type=reset value="취소">
    <input type="button" value="삭제" onClick="delcheck()"></td>
</tr>
</table>
</form>

</div>
</body>
</html>