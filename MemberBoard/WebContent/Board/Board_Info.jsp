<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" import="java.util.*, jspbook.board.*"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
    <jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
    <jsp:useBean id="c" scope="request" class="jspbook.board.CommentBean"/> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
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
%>
<div align="center">
<H2>게시판 내용 </H2><HR>
<input type=hidden name="b_num" value="<%=num%>">
<table border="1">
  <tr>
    <th>글 번호</th><td  width="500"><%=num %></td>
  </tr>
  <tr>
    <th>제 목</th><td><%=board.getB_title() %></td>
  </tr>
    <tr>
    <th>작성자</th><td><%=board.getB_userid()%></td>
  </tr>
      <tr>
    <th>내 용</th> <td  width="500" height="600"><%=board.getB_content() %></td>
  </tr>
  <tr>
    <th>작성일자</th> <td><%=board.getB_date()%></td>
  </tr>
  <tr>
    <td colspan=2 align=center>
    <button onClick="location.href='Board_update.jsp?b_num=<%=num%>&b_userid=<%=session.getAttribute("m_id")%>'">글 수정</button></td>
</tr>
</table>
<br>
<br>
<%
String userid=(String)session.getAttribute("m_id");
%>
<form name=form2 method=post action=Comment_control.jsp>
<input type=hidden name="action" value="insert">
<input type=hidden name="c_b_num" value="<%=num%>">
<input type=hidden name="c_userid" value="<%=userid%>">

<table border="1">
  <tr>
    <th>작성자</th><td><%=userid %></td>
  </tr>
  <tr>
    <th>내 용</th><td width="500"><input style="width:500px;"type="text" width="500" name="c_comment"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"> <input type=reset value="취소"></td>
</tr>
</table>
<Br>
<table border="1">
<tr>
<% 
for(Comment comment:(ArrayList<Comment>)datas){ %>
<th>댓글</th>
<td><%=comment.getC_userid() %></td>
<td width="320"><%=comment.getC_comment() %></td>
<td><%=comment.getC_date() %></td>
<td><a href="Comment_update.jsp?c_num=<%=comment.getC_num()%>&c_userid=<%=comment.getC_userid() %>&c_b_num=<%=num%>">[수정] </a></td>
</tr>
<%} %>
</table>
</form>


</div>
</body>
</html>