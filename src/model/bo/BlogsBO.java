/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : 3 thg 3, 2019
*Description: Create by MyPC
*Copyright (c) 2019 by TeddyShoes. All rights reserved.
*/
package model.bo;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import model.bean.Blogs;
import model.dao.BlogsDAO;

/**
 * @author MyPC
 *
 */
public class BlogsBO {
	BlogsDAO dao = new BlogsDAO();

	public ArrayList<model.bean.Blogs> getListBlogs() throws Exception {

		String sql = "Select * From Blogs ORDER BY blog_Id DESC";
		return dao.SelectDB(sql);
	}

	public Blogs getFindBlogsById(String id) throws Exception {
		String sql = "SELECT * FROM Blogs WHERE blog_Id = " + id;
		return dao.FindWithId(sql);
	}

	public Map<String, String> getBlog_CustomerWithId(String id) {
		String sql = "SELECT     Blogs.*, Customer.customer_id AS Expr1, Customer.username, Customer.showname\r\n" + 
				"FROM         Blogs INNER JOIN\r\n" + 
				"                      Customer ON Blogs.customer_Id = Customer.customer_id where blog_Id="
				+ id;
		return dao.blog_CustomerWithId(sql);
	}

	public boolean getAddBlogs(Blogs blog) throws Exception {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String sql = "INSERT INTO Blogs (title, describe, contents, image, customer_id, datePost) " + "VALUES (\""
				+ blog.getTitle() + "\", \"" + blog.getDescribe()+ "\", '" + blog.getContents() + "', \""
				+ blog.getImage() + "\", " + blog.getCustomer_Id() + ", DATE(\"" + dateFormat.format(date) + "\"))";
//		System.out.println(sql);
		return dao.AddData(blog, sql);
	}

	public boolean getEditBlogs(Blogs blog) throws SQLException {
		String sql = "UPDATE Blogs SET title = ?, describe = ?, contents = ?, image = ? WHERE blog_Id = ?";
		return dao.EditData(blog, sql);
	}

	public boolean getDelBlogs(String id) throws Exception {
		String sql = "DELETE FROM Blogs WHERE blog_Id = ?";
		return dao.DelData(id, sql);
	}
	
	public static void main(String[] args) {
		
	}


}
