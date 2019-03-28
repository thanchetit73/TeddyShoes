/*
*
* (C) Copyright 2019 Italia.All Right Reserved
*project Name : TeddyShoes2
*author HCD-Fresher100
*@date 28 thg 2, 2019 17:59:56
*@version 1.0
*/
package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import model.bean.ViewBEAN;

public class ViewDAO {
	public ArrayList<ViewBEAN> getAll() throws Exception{
		ArrayList<ViewBEAN> lstView = new ArrayList<ViewBEAN>();
		CoSo dc = new CoSo();
		dc.KetNoi();
		PreparedStatement stm = dc.cn.prepareStatement("SELECT * FROM Bills");
		ResultSet rs = stm.executeQuery();
		while(rs.next()) {
			int bill_Id = Integer.parseInt(rs.getString("bill_id"));
			String userName = rs.getString("username");
			String address = rs.getString("address");
			int phone_Number = Integer.parseInt(rs.getString("phone_number"));
			String email = rs.getString("email");
			String product = rs.getString("product");
			Date date_Order = rs.getDate("date_oder");		
			lstView.add(new ViewBEAN(bill_Id, userName, address, phone_Number, email, product, date_Order));		
	}
		rs.close();
		dc.cn.close();
		return lstView;
   } 
	public int Xoa(int bill_id) throws Exception {
		CoSo dc = new CoSo();
		dc.KetNoi();
		String sql = "DELETE FROM Bills where bill_id=?";
		PreparedStatement stm = dc.cn.prepareStatement(sql);
		stm.setInt(1, bill_id);
		int a = stm.executeUpdate();
		stm.close();
		dc.cn.close();
		return a;
	}

}
