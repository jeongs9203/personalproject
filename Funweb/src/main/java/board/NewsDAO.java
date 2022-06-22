package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.jdbcUtil;

import static db.jdbcUtil.*;

public class NewsDAO {
	Connection con;
	PreparedStatement pstmt, pstmt2;
	ResultSet rs;
	
	public int insertNews(NewsBean newsBean) {
		int insertCount = 0;
		int num = 1;
		
		con = getConnection();
		try {
			
			String sql = "SELECT MAX(num) FROM news"; // 테이블에 저장된 max num 
			pstmt = con.prepareStatement(sql);	
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(num) + 1; // max num에 1을 더해서 num 카운팅 
			}
			
			sql = "INSERT INTO news VALUES(?, ?, ?, ?, ?, now(), 0)";
			pstmt2 = con.prepareStatement(sql);
			
			pstmt2.setInt(1, num);
			pstmt2.setString(2, newsBean.getName());
			pstmt2.setString(3, newsBean.getPass());
			pstmt2.setString(4, newsBean.getSubject());
			pstmt2.setString(5, newsBean.getContent());
			
			insertCount = pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL구문 오류 - insertNews()");
		} finally {
			close(rs);
			close(pstmt);
			close(pstmt2);
			close(con);
		}
		
		return insertCount;
	}
	
	public int selectListCount() {
		int listCount = 0;
		
		con = getConnection();
		try {
			String sql = "SELECT COUNT(num) FROM news"; // 테이블에 저장된 레코드 개수
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL구문 오류 - selectListCount()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return listCount;
	}
	
	public ArrayList<NewsBean> selectNewsList(int pageNum, int listLimit) {
		ArrayList<NewsBean> newsList = null;
		
		con = getConnection();
		try {
			String sql = "SELECT * FROM news ORDER BY num DESC";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			newsList = new ArrayList<NewsBean>();
			
			while(rs.next()) {
				NewsBean newsBean = new NewsBean();
				newsBean.setNum(rs.getInt("num"));
				newsBean.setName(rs.getString("name"));
				newsBean.setSubject(rs.getString("subject"));
				newsBean.setDate(rs.getDate("date"));
				newsBean.setReadcount(rs.getInt("readcount"));
				
				newsList.add(newsBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL구문 오류 - selectListCount()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return newsList;
	}
	
	public void updateReadCount(int num) {
		con = getConnection();
		
		try {
			String sql = "UPDATE news SET readcount = readcount + 1 WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL구문 오류 - updateReadCount()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
	}
	
	public NewsBean selectNews(int num) {
		NewsBean newsBean = null;
		con = getConnection();
		try {
			String sql = "SELECT * FROM news WHERE num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				newsBean = new NewsBean();
				newsBean.setNum(rs.getInt("num"));
				newsBean.setName(rs.getString("name"));
				newsBean.setPass(rs.getString("pass"));
				newsBean.setSubject(rs.getString("subject"));
				newsBean.setContent(rs.getString("content"));
				newsBean.setDate(rs.getDate("date"));
				newsBean.setReadcount(rs.getInt("readcount"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL구문 오류 - selectNews()");
		}
		
		
		return newsBean;
	}
	

	public int updateNews(NewsBean newsBean) {
		int updateCount = 0;
		con = getConnection();
		try {
			String sql = "SELECT pass FROM news WHERE num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, newsBean.getNum());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pass").equals(newsBean.getPass())) {
					sql = "UPDATE news SET name=?, subject=?, content=? WHERE num=?";
					pstmt2 = con.prepareStatement(sql);
					
					pstmt2.setString(1, newsBean.getName());
					pstmt2.setString(2, newsBean.getSubject());
					pstmt2.setString(3, newsBean.getContent());
					pstmt2.setInt(4, newsBean.getNum());
					
					updateCount = pstmt2.executeUpdate();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - updateNews()");
		} finally {
			close(rs);
			close(pstmt2);
			close(pstmt);
			close(con);
		}
		
		return updateCount;
	}
	
	public int deleteNews(int num, String pass) {
		int deleteCount = 0;
		con = getConnection();
		try {
			String sql = "SELECT * FROM news WHERE num=? AND pass=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sql = "DELETE FROM news WHERE num=?";
				pstmt2 = con.prepareStatement(sql);
				
				pstmt2.setInt(1, num);
				
				deleteCount = pstmt2.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - deleteNews()");
		} finally {
			close(rs);
			close(pstmt2);
			close(pstmt);
			close(con);
		}
		
		return deleteCount;
	}
	
	public int searchListCount(String search, String searchType) {
		int listCount = 0;
		con = getConnection();
		try {
			String sql = "SELECT COUNT(num) FROM news WHERE " + searchType + " LIKE ? ";
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
	
	public ArrayList<NewsBean> selectSearchList(String search, int pageNum, int listLimit, String searchType) {
		ArrayList<NewsBean> newsList = null;
		
		
		con = getConnection();
		try {
			int startRow = (pageNum - 1) * listLimit;
			
			String sql = "SELECT * FROM news WHERE " + searchType + " LIKE ? ORDER BY num DESC LIMIT ?, ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, listLimit);
			
			rs = pstmt.executeQuery();
			
			newsList = new ArrayList<NewsBean>();
			
			while(rs.next()) {
				NewsBean newsBean = new NewsBean();
				
				newsBean.setNum(rs.getInt("num"));
				newsBean.setPass(rs.getString("pass"));
				newsBean.setName(rs.getString("name"));
				newsBean.setSubject(rs.getString("subject"));
				newsBean.setContent(rs.getString("content"));
				newsBean.setDate(rs.getDate("date"));
				newsBean.setReadcount(rs.getInt("readcount"));
				
				newsList.add(newsBean);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectSearchList()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		
		return newsList;
		
	}
	
	public ArrayList<NewsBean> selectRecentNewsList() {
		ArrayList<NewsBean> newsList = null;
		
		con = jdbcUtil.getConnection();
		try {
			String sql = "SELECT * FROM news ORDER BY num DESC LIMIT ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 5);
			
			rs = pstmt.executeQuery();
			
			newsList = new ArrayList<NewsBean>();
			
			while(rs.next()) {
				NewsBean newsBean = new NewsBean();
				
				newsBean.setSubject(rs.getString("subject"));
				newsBean.setName(rs.getString("name"));
				newsBean.setDate(rs.getDate("date"));
				newsBean.setNum(rs.getInt("num"));
				
				newsList.add(newsBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 -  selectRecentNewsList()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return newsList;
	}
}
