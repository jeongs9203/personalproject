package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// JDBC 활용 시 데이터베이스 접근 관련 작업을 수행하는 용도의 클래스 정의
// => DB접속,
public class jdbcUtil {
	// 1. DB 접속을 수행하는 getConnection() 메서드 정의
	// => 외부에서 인스턴스 없이도 메서드 호출이 가능하도록 static 선언
	public static Connection getConnection() {
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/funweb";
		String user = "root";
		String password = "1234";
		
		Connection con = null;
		
		try {
			// 1단계 . JDBC 드라이버 클래스 로드
			Class.forName(driver);	
			// 드라이버 클래스 위치가 잘못되었을 경우 ClassNotFoundException 예외발생할 수 있음
			// 따라서, try - catch블록을 사용 catch 블록에서 ClassNotFoundException 발생에 대한 대비책을 세워야함
			// 현재 예외가 발생하는 위치 아래쪽의 코드 실행이 중지되고 catch (ClassNotFoundException e) {} 부분으로 흐름이 이동함
			
			// 2단계 DB 접속
			con = DriverManager.getConnection(url, user, password);
			// DB 접속이 실패 했을 경우 SQLException 예외 발생할 수 있음
			// 따라서, try - catch블록을 사용 catch 블록에서 SQLException 발생에 대한 대비책을 세워야함
			// => DB 접속 정보 중 하나라도 잘못되면 문제가 발생하므로 처리 필요
			// => 현재 예외가 발생하는 위치 아래쪽 코드 실행이 중지되고 catch (SQLException e) {} 부분으로 흐름이 이동함
		} catch (ClassNotFoundException e) {
			// 드라이버 클래스 위치가 잘못되었을 경우 자동으로 실행되는 코드 위치
			e.printStackTrace();
			System.out.println("드라이버 로드 실패!");
		} catch (SQLException e) {
			// DB 접속이 불가능할 경우(정보가 틀렷을 경우) 자동으로 실행되는 코드 위치
			e.printStackTrace();
			System.out.println("DB 접속 실패!");
		}
		
		return con;
		
	}
	
	public static void close(Connection con) {
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static void close(PreparedStatement pstmt) {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static void close(ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
}
