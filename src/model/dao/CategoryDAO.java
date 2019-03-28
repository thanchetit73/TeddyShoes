/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : 28 thg 2, 2019
*Description: Create by MyPC
*Copyright (c) 2019 by TeddyShoes. All rights reserved.
*/
package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Category;

/**
 * @author PhuongBT
 *
 */
public class CategoryDAO {
	// hàm get hiển thị tất cát loại sản phẩm
	public ArrayList<Category> getListCategory() throws SQLException, ClassNotFoundException {
        Connection connection = DB.getSQLServerConnection();
        String sql = "SELECT * FROM Type_Products";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Category> list = new ArrayList<Category>();
       
        while (rs.next()) {
        	 Category c = new Category();
         c.setType_ID(rs.getString("type_Id"));
         c.setType_Name(rs.getString("name"));
        
            list.add(c);
        }
        return list;
    }
	// hàm thêm mới 1 loại sản phẩm
	public void insertCategory(String mtl, String ttl) throws ClassNotFoundException, SQLException {
		Connection con = DB.getSQLServerConnection();
		String sql = 	String.format("INSERT INTO Type_Products(type_Id,name) "+
				" VALUES ( '%s','%s' )", mtl, ttl);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.executeUpdate();
	}
	// hàm cập nhập tên loại sản phẩm
	public static void update_ct(String mtl, String ttl) throws SQLException, ClassNotFoundException {

		Connection con = DB.getSQLServerConnection();
		String sql=	"UPDATE Type_Products SET name = ? WHERE type_Id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ttl);
			ps.setString(2, mtl);
		
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		// hàm chọn 1 loại sản phẩm để sửa
	}
	public static Category get1CategotyType(String mtl) throws ClassNotFoundException, SQLException {
		Category dsm = new Category();
		Connection con = DB.getSQLServerConnection();
		String sql=	String.format("SELECT *  FROM Type_Products WHERE type_Id = '%s'", mtl);
		ResultSet rs = null;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			rs= ps.executeQuery();
			while(rs.next()) {
						dsm.setType_ID(rs.getString("type_Id"));
						dsm.setType_Name(rs.getString("name"));
						
					}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dsm;
	}
	// hàm xóa 1 loại sản phẩm 
	public void deleteCt(String mtl) throws SQLException, ClassNotFoundException {
		Connection connection = DB.getSQLServerConnection();
		String sql = String.format("DELETE FROM Type_Products WHERE type_Id = '%s'", mtl);
		try {
		PreparedStatement ps = connection.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		connection.close();
	}

}
