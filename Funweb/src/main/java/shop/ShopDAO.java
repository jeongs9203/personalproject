package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static db.jdbcUtil.*;

public class ShopDAO {
	Connection con;
	PreparedStatement pstmt, pstmt2;
	ResultSet rs;
	
	public void insertShop(ShopBean shopBean) {
		con = getConnection();
		try {
			String sql = "INSERT INTO shop VALUES(?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, shopBean.getId());
			pstmt.setString(2, shopBean.getProduct_id());
			pstmt.setInt(3, shopBean.getQty());
			pstmt.setInt(4, shopBean.getPrice());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - insertShop()");
		} finally {
			close(pstmt);
			close(con);
		}
	}
	
	public ArrayList<ShopBean> selectShopList(String id) {
		ArrayList<ShopBean> shopList = null;
		
		con = getConnection();
		try {
			String sql = "SELECT * FROM shop WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			shopList = new ArrayList<ShopBean>();
			
			while(rs.next()) {
				ShopBean shopBean = new ShopBean();
				shopBean.setProduct_id(rs.getString("product_id"));
				shopBean.setPrice(rs.getInt("price"));
				shopBean.setQty(rs.getInt("qty"));
				
				shopList.add(shopBean);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectShopList()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return shopList;
	}
	
	public ArrayList<ShopBean> selectPhotoList(String product_id) {
		ArrayList<ShopBean> photoList = null;
		con = getConnection();
		
		try {
			
			String sql = "SELECT photo FROM food WHERE name=?";
			pstmt = con.prepareStatement(sql);
			
				pstmt.setString(1, product_id);
			
			rs = pstmt.executeQuery();
			
			photoList = new ArrayList<ShopBean>();
			
			while(rs.next()) {
				ShopBean shopBean = new ShopBean();
				shopBean.setPhoto(rs.getString(1));
				
				photoList.add(shopBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 -selectPhotoList()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return photoList;
	}
}







