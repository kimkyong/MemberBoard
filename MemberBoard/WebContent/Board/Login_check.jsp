<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%request.setCharacterEncoding("utf-8");%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>  
    <%
    try {
    	String jdbc_driver="oracle.jdbc.driver.OracleDriver";
    	Class.forName(jdbc_driver);
    	String jdbc_url="jdbc:oracle:thin:@127.0.0.1:1521:MyOracle";
        Connection conn = DriverManager.getConnection(jdbc_url,"ora_user1","dbpass");
        
         String user_id= request.getParameter("m_id");
         String user_pw= request.getParameter("m_pw");
         
        Statement st = conn.createStatement();
        String sql = "SELECT * FROM member WHERE m_id='" + user_id + "' AND m_pw='" + user_pw + "'";
        st.executeUpdate(sql);
        ResultSet rs = st.executeQuery(sql);
        
        // isLogin 은 로그인 확인 유무를 위한 변수
        Boolean isLogin = false;
        while(rs.next()) {
            // rs.next가 true 라면 = 정보가 있다
            isLogin = true;
        }
        
        // DB에 내가 적은 정보가 있다면
        if(isLogin) {
            // 지금 로그인할 id와 pw를 session에 저장하고
            session.setAttribute("m_id", user_id); 
            session.setAttribute("m_pw", user_pw);
            // 첫 페이지로 돌려보낸다
            response.sendRedirect("Login.jsp");    
        } else {
            // DB에 내가적은 정보가 없다면 경고창을 띄워준다
            %> <script> alert("로그인 실패"); history.go(-1); </script> <%            
        }
        
        
    } catch (Exception e) {       
        out.println("DB 연동 실패");
    }
    %>


</body>
</html>