/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : 4 thg 3, 2019
*Description: Create by MyPC
*Copyright (c) 2019 by TeddyShoes. All rights reserved.
*/
package model.bo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import model.bean.Reviews;
import model.dao.ReviewsDAO;

/**
 * @author MyPC
 *
 */
public class ReviewsBO {
	ReviewsDAO dao = new ReviewsDAO();

	public ArrayList<model.bean.Reviews> getListReviews() throws Exception {

		String sql = "SELECT * FROM Reviews";
		return dao.SelectDB(sql);
	}
	
	public Reviews getReviewsById(String id) {
		String sql = "SELECT * FROM Reviews WHERE review_Id = " + id;
		return dao.FindWithId(sql);
	}
	
	//Lấy toàn bộ review của bài viết id_baiViet
	public ArrayList<Reviews> getListReviewsWithID_Blogs(String blog_Id) throws Exception { 
		String sql = "  SELECT   Reviews.*\r\n" + 
				"			FROM         Reviews INNER JOIN Blogs ON Blogs.blog_Id = Reviews.blog_Id \r\n" + 
				"								  INNER JOIN Customer ON Reviews.customer_Id = Customer.customer_id\r\n" + 
				"								   where Reviews.blog_Id= "+blog_Id+" ORDER BY review_id DESC";
		return dao.SelectDB(sql);
	}
	
	public boolean getAddReviews(Reviews review) throws Exception {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String sql = "INSERT INTO Reviews (contents, blog_Id, customer_Id, datePost) " + "VALUES (\""
				+ review.getContents() + "\", " + review.getBlogId() + ", " + review.getCustomerId() + ", DATE(\"" + dateFormat.format(date) + "\"))";
		return dao.AddData(review, sql);
	}
	
	public boolean getDelReviews(String id) throws Exception {
		String sql = "DELETE FROM Reviews WHERE review_Id = ?";
		return dao.DelData(id, sql);
	}
	
	public boolean getEditReviews(Reviews review) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		review.setDatePost(dateFormat.format(date));
		String sql = "UPDATE Reviews SET contents = ? , datePost = DATE(?) WHERE review_Id = ?";
		return dao.EditData(review, sql);
	}

}
