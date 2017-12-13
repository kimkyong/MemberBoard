package jspbook.board;
import java.sql.*;
import java.util.*;
import jspbook.board.Board;

public class CommentBean {

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
		
		
		public boolean insertDB(Comment comment) {
			connect();
			
			String sql="insert into B_comment(c_num, c_b_num, c_userid, c_comment) values(c_num_seq.nextval,?,?,?)";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, comment.getC_b_num());
				pstmt.setString(2, comment.getC_userid());
				pstmt.setString(3, comment.getC_comment());

				pstmt.executeUpdate();
				//return true;
			}catch(SQLException e) {
				e.printStackTrace();
				return false;
			}
			finally {
				disconnect();
			}
			return true;
		}
		
		public boolean updateDB(Comment comment) {
			connect();
			
			String sql="update B_comment set c_comment=? where c_num=?";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, comment.getC_comment());
				pstmt.setInt(2, comment.getC_num());
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
		
		public boolean deleteDB(int c_num) {
			connect();
			
			String sql="delete from B_comment where c_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, c_num);
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
		
		public Comment getDB(int c_num) {
			connect();
			
			String sql="select * from B_comment where c_num=?";
			
			Comment comment = new Comment();
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, c_num);;
				ResultSet rs=pstmt.executeQuery();
				
				rs.next();
				comment.setC_num(rs.getInt("c_num"));
				comment.setC_b_num(rs.getInt("c_b_num"));
				comment.setC_userid(rs.getString("c_userid"));
				comment.setC_comment(rs.getString("c_comment"));
				comment.setC_date(rs.getString("c_date"));
				rs.close();
			}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
			return comment;
			
		}
		
		
		public ArrayList<Comment> getDBList(int c_b_num){
			connect();
			ArrayList<Comment> datas=new ArrayList<Comment>();
			try {
				String sql="select * from B_comment where c_b_num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, c_b_num);


				ResultSet rs=pstmt.executeQuery();
				while(rs.next()) {
					Comment comment = new Comment();
					
					comment.setC_num(rs.getInt("c_num"));
					comment.setC_b_num(rs.getInt("c_b_num"));
					comment.setC_userid(rs.getString("c_userid"));
					comment.setC_comment(rs.getString("c_comment"));
					comment.setC_date(rs.getString("c_date"));
					datas.add(comment);
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



