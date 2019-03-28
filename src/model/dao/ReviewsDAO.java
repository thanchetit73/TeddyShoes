/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : 4 thg 3, 2019
*Description: Create by MyPC
*Copyright (c) 2019 by TeddyShoes. All rights reserved.
*/
package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Reviews;



/**
 * @author MyPC
 *
 */
public class ReviewsDAO {
	public ArrayList<Reviews> SelectDB(String sql) throws Exception {
		ArrayList<Reviews> list = new ArrayList<Reviews>();
		CoSo cs = new CoSo();
		try {
			cs.KetNoi();
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				Reviews rv = new Reviews();
				rv.setBlogId(rs.getString("review_Id"));
				rv.setContents(rs.getString("contents"));
				rv.setBlogId(rs.getString("blog_Id"));
				rv.setCustomerId(rs.getString("customer_Id"));
				rv.setDatePost(rs.getString("datePost"));
				rv.setUserName(rs.getString("userName"));
				list.add(rv);
			}
			rs.close();
			cs.cn.close();
			return list;
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		return null;
	}

	public Reviews FindWithId(String sql) {		
		Reviews rv = new Reviews();
		CoSo cs = new CoSo();
		try {
			cs.KetNoi();
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {			
				rv.setBlogId(rs.getString("id"));
				rv.setContents(rs.getString("contents"));
				rv.setBlogId(rs.getString("blog_Id"));
				rv.setCustomerId(rs.getString("customer_Id"));
				rv.setDatePost(rs.getString("datePost"));
				rv.setUserName(rs.getString("userName"));
			}
			rs.close();
			cs.cn.close();
			return rv;

		} catch (Exception e) {			
			e.printStackTrace();
		}
		return null;
	}

	// Phương thức thêm
	public boolean AddData(Reviews rv, String sql) throws Exception {
		CoSo cs = new CoSo();
		try {
			cs.KetNoi();
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			rs.close();
			cs.cn.close();
			return true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return false;
	}

	// Phương thức xóa
	public boolean DelData(String id, String sql) throws Exception {
		CoSo cs = new CoSo();
		try {
			cs.KetNoi();
			PreparedStatement cmd = cs.cn.prepareStatement(sql);		
			cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, id);
			ResultSet rs = cmd.executeQuery();
			rs.close();
			cs.cn.close();
			return true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return false;
	}

	// Phương thức sửa
	public boolean EditData(Reviews rv, String sql) {
		CoSo cs = new CoSo();
		try {
			cs.KetNoi();
			PreparedStatement cmd = cs.cn.prepareStatement(sql);		
			cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, rv.getContents());
			cmd.setString(2, rv.getDatePost());
			cmd.setString(3, rv.getCustomerId());			
			ResultSet rs = cmd.executeQuery();
			rs.close();
			cs.cn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return false;
	}

	public static void main(String[] args) {
		
	}

}
