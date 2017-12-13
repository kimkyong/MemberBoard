<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="error.jsp" import="jspbook.board.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="b" scope="request" class="jspbook.board.BoardBean"/> 
<jsp:useBean id="board" class="jspbook.board.Board"/>
<jsp:setProperty name="board" property="*"/> 
<% 
	String action = request.getParameter("action");
   	String userid=(String)session.getAttribute("m_id");

	if(action.equals("list")) {
		ArrayList<Board> datas = b.getDBList("none");
		request.setAttribute("datas", datas);
		pageContext.forward("Board_list.jsp");
	}
	else if(action.equals("mylist")) {
		ArrayList<Board> mydatas = b.getDBList(userid);
		request.setAttribute("datas", mydatas);
		pageContext.forward("Board_Mylist.jsp");
	}
	else if(action.equals("insert")) {		
		if(b.insertDB(board)) {
			response.sendRedirect("Board_control.jsp?action=list");
		}
		else
			throw new Exception("DB 입력오류");
	}
	else if(action.equals("update")) {
			if(b.updateDB(board)) {
				response.sendRedirect("Board_control.jsp?action=list");
			}
			else
				throw new Exception("DB 갱신오류");
	}
	else if(action.equals("delete")) {
		if(b.deleteDB(board.getB_num())) {
			response.sendRedirect("Board_control.jsp?action=list");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!')</script>");
	}
%>