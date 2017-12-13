package jspbook.board;

import java.sql.*;
import java.util.*;
import jspbook.board.Member;

public class MemberBean {
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	String jdbc_driver="oracle.jdbc.driver.OracleDriver";
	String jdbc_url="jdbc:oracle:thin:@127.0.0.1:1521:MyOracle";
	
	void connect() {
		try {
			Class.forName(jdbc_driver);
			
			conn=DriverManager.getConnection(jdbc_url,"ora_user1","dbpass");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if(pstmt !=null) {
			try {
				pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(conn != null)
		{
			try {
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public boolean insertDB(Member member) {
		connect();
		
		String sql="insert into member(m_id,m_pw, m_name, m_email,m_birth, m_tel) values(?,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());
			pstmt.setString(2, member.getM_pw());
			pstmt.setString(3, member.getM_name());
			pstmt.setString(4, member.getM_email());
			pstmt.setString(5, member.getM_birth());
			pstmt.setString(6, member.getM_tel());
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	public boolean updateDB(Member member) {
		connect();
		
		String sql="update member set m_name=?, m_email=?,m_tel=?,m_birth=? where m_id=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, member.getM_name());
			pstmt.setString(2, member.getM_email());
			pstmt.setString(3, member.getM_tel());
			pstmt.setString(4, member.getM_birth());
			pstmt.setString(5, member.getM_id());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	public boolean deleteDB(String m_id) {
		connect();
		
		String sql="delete from member where m_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	public Member getDB(String m_id) {
		connect();
		
		String sql="select * from member where m_id=?";
		Member member=new Member();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m_id);;
			ResultSet rs=pstmt.executeQuery();
			
			rs.next();
			member.setM_id(rs.getString("m_id"));
			member.setM_pw(rs.getString("m_pw"));
			member.setM_name(rs.getString("m_name"));
			member.setM_email(rs.getString("m_email"));
			member.setM_tel(rs.getString("m_tel"));
			member.setM_birth(rs.getString("m_birth"));
			rs.close();
		}catch(SQLException e) {
		e.printStackTrace();
	}
	finally {
		disconnect();
	}
		return member;
		
	}
	
	public ArrayList<Member> getDBList(){
		connect();
		ArrayList<Member> datas=new ArrayList<Member>();
		
		String sql="select * from member order by m_id desc";
		try {
			pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				Member member=new Member();
				
				member.setM_id(rs.getString("m_id"));
				member.setM_id(rs.getString("m_pw"));
				member.setM_name(rs.getString("m_name"));
				member.setM_email(rs.getString("m_email"));
				member.setM_tel(rs.getString("m_tel"));
				member.setM_birth(rs.getString("m_birth"));
				datas.add(member);
			}
			rs.close();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}
}
