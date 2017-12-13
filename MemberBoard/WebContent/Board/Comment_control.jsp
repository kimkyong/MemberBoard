<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="error.jsp" import="jspbook.board.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="c" scope="request" class="jspbook.board.CommentBean"/> 
<jsp:useBean id="comment" class="jspbook.board.Comment"/>
<jsp:setProperty name="comment" property="*"/> 
<% 
	String action = request.getParameter("action");
   	int c_b_num=Integer.parseInt(request.getParameter("c_b_num"));
 	//System.out.println(action);
	if(action.equals("list")) {
		ArrayList<Comment> datas = c.getDBList(c_b_num);
		request.setAttribute("datas", datas);
		pageContext.forward("Board_Info.jsp?b_num="+c_b_num);
	}
	else if(action.equals("insert")) {		
		if(c.insertDB(comment)) {
			response.sendRedirect("Comment_control.jsp?action=list&c_b_num="+c_b_num);
		}
		else
			throw new Exception("DB 입력오류");
	}
	else if(action.equals("update")) {
			if(c.updateDB(comment)) {
				response.sendRedirect("Comment_control.jsp?action=list&c_b_num="+c_b_num);
			}
			else
				throw new Exception("DB 갱신오류");
	}
	else if(action.equals("delete")) {
		if(c.deleteDB(comment.getC_num())) {
			response.sendRedirect("Comment_control.jsp?action=list&c_b_num="+c_b_num);
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!')</script>");
	}
%>