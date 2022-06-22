package food;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static db.jdbcUtil.*;

public class FoodDAO {
	Connection con;
	PreparedStatement pstmt, pstmt2;
	ResultSet rs;
	
	public ArrayList<FoodBean> selectFoodList() {
		ArrayList<FoodBean> foodList = null;
		con = getConnection();
		try {
			String sql = "SELECT * FROM food";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			foodList = new ArrayList<FoodBean>();
			
			while(rs.next()) {
				FoodBean foodBean = new FoodBean();
				foodBean.setPhoto(rs.getString("photo"));
				foodBean.setName(rs.getString("name"));
				foodBean.setPrice(rs.getInt("price"));
				
				foodList.add(foodBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectFoodList()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return foodList;
	}
	
	public FoodBean selectEachFood(String name) {
		FoodBean foodBean = null;
		con = getConnection();
		try {
			String sql = "SELECT * FROM food WHERE name=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			
			rs = pstmt.executeQuery();
			
			foodBean = new FoodBean();
			while(rs.next()) {
				foodBean.setPhoto(rs.getString("photo"));
				foodBean.setPrice(rs.getInt("price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectEachFood()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return foodBean;
	}
	
	public ArrayList<FoodBean> selectBeverageList() {
		ArrayList<FoodBean> foodList = null;
		con = getConnection();
		try {
			String sql = "SELECT * FROM food WHERE kind = 'beverage'";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			foodList = new ArrayList<FoodBean>();
			
			while(rs.next()) {
				FoodBean foodBean = new FoodBean();
				foodBean.setPhoto(rs.getString("photo"));
				foodBean.setName(rs.getString("name"));
				foodBean.setPrice(rs.getInt("price"));
				
				foodList.add(foodBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectBeverageList()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return foodList;
	}
	
	public ArrayList<FoodBean> selectCoffeeList() {
		ArrayList<FoodBean> foodList = null;
		con = getConnection();
		try {
			String sql = "SELECT * FROM food WHERE kind = 'coffee'";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			foodList = new ArrayList<FoodBean>();
			
			while(rs.next()) {
				FoodBean foodBean = new FoodBean();
				foodBean.setPhoto(rs.getString("photo"));
				foodBean.setName(rs.getString("name"));
				foodBean.setPrice(rs.getInt("price"));
				
				foodList.add(foodBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectCoffeeList()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return foodList;
	}
	
	public ArrayList<FoodBean> selectDessertList() {
		ArrayList<FoodBean> foodList = null;
		con = getConnection();
		try {
			String sql = "SELECT * FROM food WHERE kind = 'dessert'";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			foodList = new ArrayList<FoodBean>();
			
			while(rs.next()) {
				FoodBean foodBean = new FoodBean();
				foodBean.setPhoto(rs.getString("photo"));
				foodBean.setName(rs.getString("name"));
				foodBean.setPrice(rs.getInt("price"));
				
				foodList.add(foodBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectDessertList()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return foodList;
	}
}
