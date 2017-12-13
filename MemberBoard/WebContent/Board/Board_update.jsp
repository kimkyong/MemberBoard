<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" import="jspbook.board.Board" import="jspbook.board.BoardBean"%>
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
<title>게시판 수정</title>
</head>

<body>
<button onClick="location.href='Board_control.jsp?action=list'">게시글 </button> 
<button onClick="location.href='Login.jsp'">메인화면</button>
<%
int num = 0;
if(request.getParameter("b_num")!=null){
	num=Integer.parseInt(request.getParameter("b_num"));
}
Board board =new BoardBean().getDB(num);
String userid=request.getParameter("b_userid");

 if(!userid.equals(board.getB_userid())){
	 out.println("<script>");
		out.println("alert('글 수정 권한이 없습니다.');");
		out.println("location.href='Board_control.jsp?action=list'");
		out.println("</script>");
 }
%>
<div align="center">
<H2>게시판 수정 </H2>
<HR>
<form name=form1 method=post action=Board_control.jsp>
<input type=hidden name="b_num" value="<%=num%>">
<input type=hidden name="b_userid" value="<%=board.getB_userid()%>">
<input type=hidden name="action" value="update">
<table border="1">
  <tr>
    <th>글 번호</th><td><%=num %></td>
  </tr>
  <tr>
    <th>제 목</th>
    <td width="500"><input style="width:500px;" type="text" name="b_title"  maxlength="100" value=<%=board.getB_title() %>></td>
  </tr>
    <tr>
    <th>작성자</th><td><%=board.getB_userid()%></td>
  </tr>
      <tr>
    <th>내 용</th>
    <td><input style="width:500px; height:500px" type="text"  maxlength="2000" name="b_content" value=<%=board.getB_content() %>></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type="submit" value="수정"> <button onClick="location.href='Board_Info.jsp'">취 소</button> 
    <input type="button" value="삭제" onClick="delcheck()"></td>
</tr>
</table>
</form>
</div>
</body>
</html>