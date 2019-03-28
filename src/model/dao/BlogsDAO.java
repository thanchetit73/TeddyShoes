/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : 3 thg 3, 2019
*Description: Create by MyPC
*Copyright (c) 2019 by TeddyShoes. All rights reserved.
*/
package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import model.bean.Blogs;


/**
 * @author MyPC
 *
 */
public class BlogsDAO {
	public ArrayList<Blogs> SelectDB(String sql) throws Exception {
		ArrayList<Blogs> list = new ArrayList<Blogs>();
		CoSo cs = new CoSo();
		try {
			cs.KetNoi();
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				// Táº¡o má»™t Ä‘á»‘i tÆ°á»£ng gÃ¡n giÃ¡ trá»‹
				Blogs blogs = new Blogs();
				blogs.setBlogId(rs.getString("blog_Id"));
				blogs.setCustomer_Id(rs.getString("customer_Id"));
				blogs.setImage(rs.getString("image"));
				blogs.setDescribe(rs.getString("describe"));
				blogs.setContents(rs.getString("contents"));
				blogs.setTitle(rs.getString("title"));
				blogs.setDatePost(rs.getString("datePost"));			
				// ThÃªm vÃ o danh sÃ¡ch
				list.add(blogs);
			}
			// Ä�Ã³ng káº¿t ná»‘i
			rs.close();
			cs.cn.close();
			return list;
		} catch (SQLException e) {
			// Ä�Ã³ng káº¿t ná»‘i			
			e.printStackTrace();
		}
		return null;
	}

	public Blogs FindWithId(String sql) throws Exception {
		CoSo cs = new CoSo();
		Blogs blogs = null;
		try {
			cs.KetNoi();
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				// Táº¡o má»™t Ä‘á»‘i tÆ°á»£ng gÃ¡n giÃ¡ trá»‹
				 blogs = new Blogs();
				blogs.setBlogId(rs.getString("blog_Id"));
				blogs.setCustomer_Id(rs.getString("customer_Id"));
				blogs.setImage(rs.getString("image"));
				blogs.setDescribe(rs.getString("describe"));
				blogs.setContents(rs.getString("contents"));
				blogs.setTitle(rs.getString("title"));
				blogs.setDatePost(rs.getString("datePost"));			
				// ThÃªm vÃ o danh sÃ¡ch
				//return blogs;
			}
			// Ä�Ã³ng káº¿t ná»‘i
			rs.close();
			cs.cn.close();
			
		} catch (SQLException e) {
			// Ä�Ã³ng káº¿t ná»‘i			
			e.printStackTrace();
		}
		//System.out.println("kkk");
		//System.out.println(blogs.getCustomer_Id());
		return blogs;
	}


	public Map<String, String> blog_CustomerWithId(String sql) {
		
		Map<String, String> blog_Customer = new HashMap<String, String>();
		CoSo cs = new CoSo();
		try {
			cs.KetNoi();
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				blog_Customer.put("blog_Id", String.valueOf(rs.getString("blog_Id")));
				blog_Customer.put("title", rs.getString("title"));
				blog_Customer.put("describe", rs.getString("describe"));
				blog_Customer.put("contents", rs.getString("contents"));
				blog_Customer.put("image", rs.getString("image"));
				blog_Customer.put("avatar", rs.getString("avatar"));
				blog_Customer.put("datePost", rs.getString("datePost"));
				blog_Customer.put("customer_Id", String.valueOf(rs.getString("customer_Id")));
				blog_Customer.put("userName", rs.getString("userName"));
				blog_Customer.put("showName", rs.getString("showName"));
			}
			// Ä�Ã³ng káº¿t ná»‘i
			rs.close();
			cs.cn.close();
			return blog_Customer;
		} catch (Exception e) {
			// Ä�Ã³ng káº¿t ná»‘i
			e.printStackTrace();
		}
		return null;
	}


	// PhÆ°Æ¡ng thá»©c thÃªm
	public boolean AddData(Blogs blog, String sql) throws Exception {
		// Má»Ÿ káº¿t ná»‘i 
		CoSo cs = new CoSo();				
		PreparedStatement rs = null;
		// Cho phÃ©p truyá»�n cÃ¢u lá»‡nh SQL cÃ³ tham sá»‘ vÃ o
		try {
			cs.KetNoi();
			rs = cs.cn.prepareStatement(sql);
			rs.executeUpdate();

			rs.close();
			cs.cn.close();
			return true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}		return false;
	}

	public boolean EditData(Blogs blog, String sql) throws SQLException {
		CoSo cs = new CoSo();				
		PreparedStatement rs = null;
		try {
			cs.KetNoi();
			rs = cs.cn.prepareStatement(sql);
			rs.setString(1, blog.getTitle());
			rs.setString(2, blog.getDescribe());
			rs.setString(3, blog.getContents());
			rs.setString(4, blog.getImage());
			rs.setString(5, String.valueOf(blog.getBlogId()));

			rs.executeUpdate();
			rs.close();
			cs.cn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		rs.close();
		cs.cn.close();
		return false;
	}

	// PhÆ°Æ¡ng thá»©c xÃ³a
	public boolean DelData(String id, String sql) throws Exception {
		CoSo cs = new CoSo();				
		PreparedStatement rs = null;
		try {
			cs.KetNoi();
			rs = cs.cn.prepareStatement(sql);
			rs.setString(1, id);
			rs.executeUpdate();
			rs.close();
			cs.cn.close();
			return true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		rs.close();
		cs.cn.close();
		return false;
	}

}
