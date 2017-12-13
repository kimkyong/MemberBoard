<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="error.jsp" import="jspbook.board.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="m" scope="request" class="jspbook.board.MemberBean"/> 
<jsp:useBean id="member" class="jspbook.board.Member"/>
<jsp:setProperty name="member" property="*"/> 
<% 
	String action = request.getParameter("action");

	if(action.equals("main")) {
		ArrayList<Member> datas = m.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("Login.jsp");
	}
	else if(action.equals("insert")) {		
		if(m.insertDB(member)) {
			response.sendRedirect("Member_control.jsp?action=main");
		}
		else
			throw new Exception("DB 입력오류");
	}
	else if(action.equals("update")) {
			if(m.updateDB(member)) {
				response.sendRedirect("Member_control.jsp?action=main");
			}
			else
				throw new Exception("DB 갱신오류");
	}
	else if(action.equals("delete")) {
		if(m.deleteDB(member.getM_id())) {
			response.sendRedirect("Member_control.jsp?action=main");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!')</script>");
	}
%>