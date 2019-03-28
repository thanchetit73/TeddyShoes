/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.bean.Bill;
import model.bean.Statistical;

public class BillDAO {

	public void insertBill(Bill bill) throws SQLException, ClassNotFoundException {
		Connection connection = DB.getSQLServerConnection();
		String sql = String
				.format("INSERT INTO Bills(customer_user,total,payment,adress,date_order) " + " VALUES (?,?,?,?,?)");

		PreparedStatement ps = connection.prepareCall(sql);
		ps.setString(1, bill.getUserID());

		ps.setDouble(2, bill.getTotal());
		ps.setString(3, bill.getPayment());
		ps.setString(4, bill.getAddress());
		ps.setDate(5,  new java.sql.Date(bill.getDate().getTime()));
		System.out.println(bill.getDate() + "kk");
		ps.executeUpdate();
		System.out.println(bill.getDate());
	}

	public ArrayList<Bill> getListBill() throws ClassNotFoundException {
		try {
			Connection connection = DB.getSQLServerConnection();
			String sql = "SELECT * FROM Bills";
			PreparedStatement ps = connection.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			ArrayList<Bill> list = new ArrayList<>();
			while (rs.next()) {
				Bill bill = new Bill();
				bill.setBillID(rs.getInt("bill_Id"));
				bill.setUserID(rs.getString("customer_user"));
				bill.setTotal(rs.getDouble("total"));
				bill.setPayment(rs.getString("payment"));
				bill.setAddress(rs.getString("adress"));
				bill.setDate(rs.getDate("date_order"));
				list.add(bill);
			}
			return list;
		} catch (SQLException ex) {
			Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}
	
	// hàm chi tiest bill
	public ArrayList<Bill> getBillByID(String id) throws ClassNotFoundException {
		try {
			Connection connection = DB.getSQLServerConnection();
			String sql = "SELECT * FROM Bills where bill_id=?";
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			ArrayList<Bill> list = new ArrayList<>();
			while (rs.next()) {
				Bill bill = new Bill();
				bill.setBillID(rs.getInt("bill_Id"));
				bill.setUserID(rs.getString("customer_user"));
				bill.setTotal(rs.getDouble("total"));
				bill.setPayment(rs.getString("payment"));
				bill.setAddress(rs.getString("adress"));
				bill.setDate(rs.getDate("date_order"));
				list.add(bill);
			}
			return list;
		} catch (SQLException ex) {
			Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public int getBillID(Bill bill) throws ClassNotFoundException {
		int billid = 0;
		try {
			String sql = "Select * from Bills Where customer_user = ? and date_order = ?";
			Connection connection = DB.getSQLServerConnection();
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, bill.getUserID());
			ps.setDate(2, new java.sql.Date(bill.getDate().getTime()));
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				billid = rs.getInt("bill_id");
			}
			rs.close();
			ps.close();
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return billid;
	}
	/*
	 * public static void main(String[] args) throws SQLException {
	 * 
	 * new BillDAO().insertBill(new Bill(0, 0, 0, "s", "s", new Timestamp(new
	 * Date().getTime()))); }
	 */

	
	
	public ArrayList<Statistical> getThongKeSL(String tungay,String denngay) throws ClassNotFoundException, SQLException {
		Connection connection = DB.getSQLServerConnection();
		String sql ="SELECT Bill_Detail.product_id , Products.name , Type_Products.name as type, SUM(Bill_Detail.quantity) as quantity FROM Bill_Detail " + 
				"INNER JOIN Bills on Bill_Detail.bill_id = Bills.bill_id " + 
				"INNER JOIN Products ON Bill_Detail.product_id = Products.product_id " + 
				"INNER JOIN Type_Products on Type_Products.type_id = Products.type_id " + 
				"INNER JOIN customer on customer_id = Bills.customer_user " + 
				"WHERE Bills.date_order BETWEEN '"+tungay+"' and '"+denngay+"'" + 
				"GROUP BY Bill_Detail.product_id , Products.name , Type_Products.name " + 
				"ORDER BY quantity desc";
		
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ArrayList<Statistical> list = new ArrayList<Statistical>();
		Statistical tkSL;
		
		try {
			while (rs.next()) {
				tkSL = new Statistical();
				tkSL.setNameProduct(rs.getString("name"));
				tkSL.setType(rs.getString("type"));
				tkSL.setQuantity(rs.getString("quantity"));
				list.add(tkSL);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	public int getTotal(String tungay,String denngay) throws ClassNotFoundException, SQLException {
		Connection connection = DB.getSQLServerConnection();
		String sql = "SELECT * FROM Bills WHERE date_order BETWEEN '"+tungay+"' and '"+denngay+"'";
		ResultSet rs = null;
		int total=0;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			while (rs.next()) {
				total += rs.getInt("total");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return total;
	}
	public ArrayList<Statistical> getThongKeGiaTien(String tugia,String dengia) throws ClassNotFoundException, SQLException {
		Connection connection = DB.getSQLServerConnection();
		String sql = "SELECT Bill_Detail.product_id , Products.name , Type_Products.name as type, SUM(Bill_Detail.quantity) as quantity FROM Bill_Detail " + 
				"INNER JOIN Bills on Bill_Detail.bill_id = Bills.bill_id " + 
				"INNER JOIN Products ON Bill_Detail.product_id = Products.product_id " + 
				"INNER JOIN Type_Products on Type_Products.type_id = Products.type_id " + 
				"INNER JOIN customer on customer_id = Bills.customer_user " + 
				"WHERE Products.unit_price BETWEEN '"+tugia+"' and '"+dengia+"' " + 
				"GROUP BY Bill_Detail.product_id , Products.name , Type_Products.name " + 
				"ORDER BY quantity desc";
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ArrayList<Statistical> list = new ArrayList<Statistical>();
		Statistical tkSL;
		
		try {
			while (rs.next()) {
				tkSL = new Statistical();
				tkSL.setNameProduct(rs.getString("name"));
				tkSL.setType(rs.getString("type"));
				tkSL.setQuantity(rs.getString("quantity"));
				list.add(tkSL);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
}
