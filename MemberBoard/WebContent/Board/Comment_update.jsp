<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" import="jspbook.board.Comment" import="jspbook.board.CommentBean" %>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글 수정</title>
</head>
<body>
<button onClick="location.href='Board_control.jsp?action=list'">게시글 </button> 
<button onClick="location.href='Login.jsp'">메인화면</button>
<%
int num = 0;
if(request.getParameter("c_num")!=null){
	num=Integer.parseInt(request.getParameter("c_num"));
}
Comment comment =new CommentBean().getDB(num);
String c_b_num=request.getParameter("c_b_num");
String userid=request.getParameter("c_userid");
String id=(String)session.getAttribute("m_id");

 if(!id.equals(userid)){
	 out.println("<script>");
		out.println("alert('댓글 수정 권한이 없습니다.');");
		out.println("location.href=Comment_control.jsp?action=list&c_b_num="+c_b_num);
		out.println("</script>");
 }

%>
<div align="center">
<H3>댓글 수정 </H3>
<HR>
<form name=form1 method=post action=Comment_control.jsp>
<input type=hidden name="c_num" value="<%=num%>">
<input type=hidden name="c_userid" value="<%=userid%>">
<input type=hidden name="c_b_num" value="<%=c_b_num %>">
<input type=hidden name="action" value="update">

<table border="1">
  <tr>
  	<th>작성자</th>
    <td><%=userid%></td>
  </tr>
    <tr>
    <th>내 용</th>
    <td><input type="text" name="c_comment" value="<%=comment.getC_comment() %>"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type="submit" value="수정"> 
    <button onClick="location.href='Comment_control.jsp?action=list&c_b_num=<%=num%>'">취 소</button> 
    <input type="button" value="삭제" onClick="delcheck()"></td>
</tr>
</table>
</form>

</div>
</body>
</html>