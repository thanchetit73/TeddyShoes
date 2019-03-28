/*
*
* (C) Copyright 2019 Italia.All Right Reserved
*project Name : TeddyShoes2
*author HCD-Fresher100
*@date 26 thg 2, 2019 23:18:14
*@version 1.0
*/
package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.bean.ViewDBillBEAN;

public class ViewDBillDAO {	
	public ArrayList<ViewDBillBEAN> getAllDB() throws Exception{
		ArrayList<ViewDBillBEAN> lstViewdb = new ArrayList<ViewDBillBEAN>();
		CoSo dc = new CoSo();
		dc.KetNoi();
		PreparedStatement stm = dc.cn.prepareStatement("SELECT * FROM Bill_Detail");
		ResultSet rs = stm.executeQuery();
		while(rs.next()) {
			int bill_Id = Integer.parseInt(rs.getString("bill_Id"));
			String userName = rs.getString("userName");
			String product = rs.getString("product");
			int quantity = Integer.parseInt(rs.getString("quantity"));
			float unit_Price = rs.getFloat("unit_Price");			
			lstViewdb.add(new ViewDBillBEAN(bill_Id, userName, product, quantity, unit_Price));
			}
		rs.close();
		dc.cn.close();
		return lstViewdb;
   }
	public ArrayList<ViewDBillBEAN> get1HD(int id) throws Exception{
		ArrayList<ViewDBillBEAN> lstViewdb = new ArrayList<ViewDBillBEAN>();
		CoSo dc = new CoSo();
		dc.KetNoi();
		PreparedStatement stm = dc.cn.prepareStatement("SELECT * FROM Bill_Detail WHERE Bill_Id=?");
		stm.setInt(1, id);
		ResultSet rs = stm.executeQuery();
		while(rs.next()) {
			int bill_Id = Integer.parseInt(rs.getString("bd_Id"));
			String userName = rs.getString("bill_id");
			String product = rs.getString("product_id");
			int quantity = Integer.parseInt(rs.getString("quantity"));
			float unit_Price = rs.getFloat("unit_Price");	
					lstViewdb.add( new ViewDBillBEAN(bill_Id, userName, product, quantity, unit_Price) );	
	}
		rs.close();
		dc.cn.close();
		return lstViewdb;
   }
	
}
