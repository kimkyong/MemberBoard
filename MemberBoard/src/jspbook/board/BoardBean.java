package jspbook.board;
import java.sql.*;
import java.util.*;

import jspbook.board.Board;

public class BoardBean {

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
		
		
		public boolean insertDB(Board board) {
			connect();
			
			String sql="insert into board(b_num, b_title, b_userid, b_content) values(b_num_seq.nextval,?,?,?)";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, board.getB_title());
				pstmt.setString(2, board.getB_userid());
				pstmt.setString(3, board.getB_content());

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
		
		public boolean updateDB(Board board) {
			connect();
			
			String sql="update board set b_title=?, b_content=?, b_date=sysdate where b_num=?";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, board.getB_title());
				pstmt.setString(2, board.getB_content());
				pstmt.setInt(3, board.getB_num());
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
		
		public boolean deleteDB(int b_num) {
			connect();
			
			String sql="delete from board where b_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, b_num);
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
		
		public Board getDB(int b_num) {
			connect();
			
			String sql="select * from board where b_num=?";
			Board board=new Board();
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, b_num);;
				ResultSet rs=pstmt.executeQuery();
				
				rs.next();
				board.setB_num(rs.getInt("b_num"));
				board.setB_title(rs.getString("b_title"));
				board.setB_userid(rs.getString("b_userid"));
				board.setB_content(rs.getString("b_content"));
				board.setB_date(rs.getString("b_date"));
				rs.close();
			}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
			return board;
			
		}
			
		public ArrayList<Board> getDBList(String id){
			connect();
			ArrayList<Board> datas=new ArrayList<Board>();
			try {
			
			if(id.equals("none")) {
				String sql="select * from board order by b_num desc";
				pstmt=conn.prepareStatement(sql);
			}
			else {
				String sql="select * from board where b_userid=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);	
			}
				ResultSet rs=pstmt.executeQuery();
				while(rs.next()) {
					Board board=new Board();
					board.setB_num(rs.getInt("b_num"));
					board.setB_title(rs.getString("b_title"));
					board.setB_userid(rs.getString("b_userid"));
					board.setB_content(rs.getString("b_content"));
					board.setB_date(rs.getString("b_date"));
					datas.add(board);
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



