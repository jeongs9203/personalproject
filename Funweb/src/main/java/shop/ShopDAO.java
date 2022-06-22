package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static db.jdbcUtil.*;

public class ShopDAO {
	Connection con;
	PreparedStatement pstmt, pstmt2, pstmt3;
	ResultSet rs;
	
	public void insertShop(ShopBean shopBean, String product_id, String id) {
		con = getConnection();
		int qty = 0;
		int price = 0;
		try {
			String sql = "SELECT * FROM shop WHERE product_id=? AND id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, shopBean.getProduct_id());
			pstmt.setString(2, id);
			
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				sql = "INSERT INTO shop VALUES(?, ?, ?, ?)";
				pstmt2 = con.prepareStatement(sql);
				
				pstmt2.setString(1, shopBean.getId());
				pstmt2.setString(2, shopBean.getProduct_id());
				pstmt2.setInt(3, shopBean.getQty());
				pstmt2.setInt(4, shopBean.getPrice());
				
				pstmt2.executeUpdate();
			} else {
				qty = rs.getInt("qty") + shopBean.getQty(); 
				price = qty * (shopBean.getPrice() / shopBean.getQty()) ;
				
				sql = "UPDATE shop SET qty=?, price=? WHERE product_id=? AND id=?";
				pstmt3 = con.prepareStatement(sql);
				
				pstmt3.setInt(1, qty);
				pstmt3.setInt(2, price);
				pstmt3.setString(3, shopBean.getProduct_id());
				pstmt3.setString(4, id);
				
				pstmt3.executeUpdate();
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - insertShop()");
		} finally {
			close(rs);
			close(pstmt3);
			close(pstmt2);
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
	
	public void deleteShop(String id, String product_id) {
		con = getConnection();
		try {
			String sql = "DELETE FROM shop WHERE id=? AND product_id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, product_id);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 -deleteShop()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
	}
}







