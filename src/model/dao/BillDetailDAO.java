/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.bean.BillDetail;


public class BillDetailDAO {

    public void insertBillDetail(BillDetail bd) throws SQLException, ClassNotFoundException {
        Connection connection = DB.getSQLServerConnection();
        String sql = "INSERT INTO Bill_Detail(bill_id,product_id,quantity,unit_Price) VALUES(?,?,?,?)";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, bd.getBillID());
        System.out.println(bd.getBillID());
        ps.setString(2, bd.getProductID());
        ps.setInt(3, bd.getQuantity());
        ps.setInt(4, bd.getPrice());
       
        ps.executeUpdate();
    }
    
  /*  public static void main(String[] args) throws SQLException {
        new BillDetailDAO().insertBillDetail(new BillDetail(0, 0, 0, 0, 0));
    }*/

}
