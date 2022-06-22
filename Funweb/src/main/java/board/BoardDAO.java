package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.jdbcUtil;

// 특정 클래스의 static 메서드를 클래스명 없이 접근하기 위한 import문
// => < 기본 문법 > import static 패키지명.클래스명.메서드명;
//				 또는 import static 패키지명.클래스명.메서드명; 
//import static db.jdbcUtil.getConnection;
//import static db.jdbcUtil.close;
import static db.jdbcUtil.*;

public class BoardDAO {
	Connection con;
	PreparedStatement pstmt, pstmt2;
	ResultSet rs;
	
	public int insertBoard(BoardBean boardBean) {
		int insertCount = 0;
		int num = 1;
		con = getConnection();
		try {
			String sql = "SELECT MAX(num) FROM board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			sql = "INSERT INTO board VALUES(?, ?, ?, ?, ?, now(), 0)";
			pstmt2 = con.prepareStatement(sql);
			
			pstmt2.setInt(1, num);
			pstmt2.setString(2, boardBean.getName());
			pstmt2.setString(3, boardBean.getPass());
			pstmt2.setString(4, boardBean.getSubject());
			pstmt2.setString(5, boardBean.getContent());
			
			insertCount = pstmt2.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - insertBoard()");
		} finally {
			close(rs);
			close(pstmt);
			close(pstmt2);
			close(con);
		}
		
		
		return insertCount;
	}
	
	public ArrayList<BoardBean> selectBoardList(int pageNum, int listLimit) {
		ArrayList<BoardBean> boardList = null;
		
		try {
			con = getConnection();
			int startRow = (pageNum - 1) * listLimit;
			String sql = "SELECT * FROM board ORDER BY num DESC LIMIT ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, listLimit);
			rs = pstmt.executeQuery();
			
			boardList = new ArrayList<BoardBean>();
			
			while(rs.next()) {
				BoardBean boardBean = new BoardBean();
				boardBean.setNum(rs.getInt("num"));
				boardBean.setName(rs.getString("name"));
				boardBean.setPass(rs.getString("pass"));
				boardBean.setSubject(rs.getString("subject"));
				boardBean.setContent(rs.getString("content"));
				boardBean.setDate(rs.getDate("date"));
				boardBean.setReadcount(rs.getInt("readcount"));
				
				boardList.add(boardBean);
			}
			
//			System.out.println(boardList);
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectBoardList()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return boardList;
	}
	
	public int selectListCount() {
		int listCount = 0;
		
		con = jdbcUtil.getConnection();
		try {
			String sql = "SELECT COUNT(num) FROM board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectListCount()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return listCount;
	}
	
	public BoardBean selectBoard(int num) {
		BoardBean bean = null;
		con = jdbcUtil.getConnection();
		try {
			String sql = "SELECT * FROM board WHERE num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean = new BoardBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setDate(rs.getDate("date"));
				bean.setReadcount(rs.getInt("readcount"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectBoard()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return bean;
	}
	
	public void updateReadCount(int num) {
		con = jdbcUtil.getConnection();
		try {
			String sql = "UPDATE board SET readcount = readcount + 1 WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - updateReadCount()");
		} finally {
			close(pstmt);
			close(con);
		} 
		
	}
	
	public int updateBoard(BoardBean boardBean) {
		int updateCount = 0;
		
		con = jdbcUtil.getConnection();
		
		try {
//			String sql = "SELECT * FROM board WHERE pass=? AND num=?";
//			pstmt = con.prepareStatement(sql);
			
//			pstmt.setString(1, boardBean.getPass());
//			pstmt.setInt(2, boardBean.getNum());
			
			String sql = "SELECT pass FROM board WHERE num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, boardBean.getNum());
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pass").equals(boardBean.getPass())) {
					sql = "UPDATE board SET name=?, subject=?, content=? WHERE num=?";
					pstmt2 = con.prepareStatement(sql);
					
					pstmt2.setString(1, boardBean.getName());
					pstmt2.setString(2, boardBean.getSubject());
					pstmt2.setString(3, boardBean.getContent());
					pstmt2.setInt(4, boardBean.getNum());
					
					updateCount = pstmt2.executeUpdate();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 -  updateBoard()");
		} finally {
			close(rs);
			close(pstmt);
			close(pstmt2);
			close(con);
		}
		return updateCount;
		
	}
	
	public int deleteBoard(int num, String pass) {
		int deleteCount = 0;
		con = jdbcUtil.getConnection();
		try {
//			String sql = "SELECT pass FROM board WHERE num=?";
//			pstmt = con.prepareStatement(sql);
			
//			pstmt.setInt(1, num);
			
			String sql = "SELECT * FROM board WHERE num=? AND pass=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
//				if(rs.getString("pass").equals(pass)) {
					sql = "DELETE FROM board WHERE num=?";
					pstmt2 = con.prepareStatement(sql);
					pstmt2.setInt(1, num);
					
					deleteCount = pstmt2.executeUpdate();
//				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 -  deleteBoard()");
		} finally {
			close(rs);
			close(pstmt);
			close(pstmt2);
			close(con);
		}
		
		
		return deleteCount;
	}
	
	public ArrayList<BoardBean> selectRecentBoardList() {
		ArrayList<BoardBean> boardList = null;
		con = jdbcUtil.getConnection();
		try {
			String sql = "SELECT * FROM board ORDER BY num DESC LIMIT ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 5);
			
			rs = pstmt.executeQuery();
			
			boardList = new ArrayList<BoardBean>();
			
			while(rs.next()) {
				BoardBean boardBean = new BoardBean();
				
				boardBean.setSubject(rs.getString("subject"));
				boardBean.setName(rs.getString("name"));
				boardBean.setDate(rs.getDate("date"));
				boardBean.setNum(rs.getInt("num"));
				
				boardList.add(boardBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 -  selectRecentBoardList()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return boardList;
	}
	
	public ArrayList<BoardBean> selectSearchList(String search, int pageNum, int listLimit, String searchType) {
		ArrayList<BoardBean> boardList = null;
		con = jdbcUtil.getConnection();
		
		try {
			
			int startRow = (pageNum - 1) * listLimit;
			
			
			String sql = "SELECT * FROM board WHERE " + searchType + " LIKE ? ORDER BY num DESC LIMIT ?, ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, listLimit);
				
			rs = pstmt.executeQuery();
			
			
			boardList = new ArrayList<BoardBean>();
			
			while(rs.next()) {
				BoardBean boardBean = new BoardBean();
				
				boardBean.setNum(rs.getInt("num"));
				boardBean.setPass(rs.getString("pass"));
				boardBean.setSubject(rs.getString("Subject"));
				boardBean.setName(rs.getString("name"));
				boardBean.setDate(rs.getDate("date"));
				boardBean.setContent(rs.getString("content"));
				boardBean.setReadcount(rs.getInt("readcount"));
				
				boardList.add(boardBean);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 -  selectSearchList()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return boardList;
	}
	
	public int searchListCount(String search, String searchType) {
		int listCount = 0;
		
		con = jdbcUtil.getConnection();
		try {
			String sql = "SELECT COUNT(num) FROM board WHERE " + searchType + " LIKE ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%" + search + "%");
				
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - searchListCount()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return listCount;
	}
	
}
