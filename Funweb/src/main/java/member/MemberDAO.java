package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.jdbcUtil;

public class MemberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 회원 추가 작업
	public int insertMember(MemberBean member) {
		int insertCount = 0;
		
		// 1단계 & 2단계
		con = jdbcUtil.getConnection();
		
		try {
			// 3단계 SQL 구문 작성 및 전달
			String sql = "INSERT INTO member VALUES(?, ?, ?, ?, now(), ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getMobile());
			
			// 4단계 SQL 구문 실행 및 결과 처리
			insertCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL구문 오류! - insertMember()");
		} finally {
			// 자원 반환
			jdbcUtil.close(pstmt);
			jdbcUtil.close(con);
		}
		
		
		return insertCount;
	}
	
	public boolean checkUser(MemberBean member) {
		boolean isLoginSucess = false;
		con = jdbcUtil.getConnection();
		
		try {
			String sql = "SELECT * FROM member WHERE id=? AND pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				isLoginSucess = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL구문 오류! - checkUser()");
		} finally {
			// 자원 반환
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
			jdbcUtil.close(con);
		}
		
		
		return isLoginSucess;
	}
	
	public MemberBean selectMemberInfo(String id) {
		MemberBean member = null;
		con = jdbcUtil.getConnection();
		
		try {
			String sql = "SELECT * FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberBean();	// Null pointer access 선언 해줘야함
				
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setDate(rs.getDate("date"));
				member.setAddress(rs.getString("address"));
				member.setPhone(rs.getString("phone"));
				member.setMobile(rs.getString("mobile")); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL구문 오류! - selectMemberInfo()");
		} finally {
			// 자원 반환
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
			jdbcUtil.close(con);
		}
		
		return member;
	}
	
	public int updateMember(MemberBean member) {
		int updateCount = 0;
		con = jdbcUtil.getConnection();
		try {
			
			if(member.getPass().equals("")) {
				String sql = "UPDATE member SET name=?, email=?, address=?, phone=?, mobile=? WHERE id=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, member.getName());
				pstmt.setString(2, member.getEmail());
				pstmt.setString(3, member.getAddress());
				pstmt.setString(4, member.getPhone());
				pstmt.setString(5, member.getMobile());
				pstmt.setString(6, member.getId());
				
			} else {
				String sql = "UPDATE member SET pass=?, name=?, email=?, address=?, phone=?, mobile=? WHERE id=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, member.getPass());
				pstmt.setString(2, member.getName());
				pstmt.setString(3, member.getEmail());
				pstmt.setString(4, member.getAddress());
				pstmt.setString(5, member.getPhone());
				pstmt.setString(6, member.getMobile());
				pstmt.setString(7, member.getId());
			
			}
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL구문 오류! - updateMember()");
		} finally {
			// 자원 반환
			jdbcUtil.close(pstmt);
			jdbcUtil.close(con);
		}
		
		return updateCount;
	}
	
	public boolean checkId(String id) {
		boolean isDuplicate = false;
		con = jdbcUtil.getConnection();
		try {
			String sql = "SELECT * FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
					isDuplicate = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			// 자원 반환
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
			jdbcUtil.close(con);
		}
		
		
		return isDuplicate;
	}
}
