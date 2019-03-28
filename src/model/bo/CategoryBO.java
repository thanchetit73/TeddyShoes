/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : 28 thg 2, 2019
*Description: Create by MyPC
*Copyright (c) 2019 by TeddyShoes. All rights reserved.
*/
package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Category;
import model.dao.CategoryDAO;

/**
 * @author MyPC
 *
 */
public class CategoryBO {
	static CategoryDAO cd = new CategoryDAO();
	// hàm get hiển thị tất cả loại sản phẩm
	public ArrayList<Category> getListM() throws ClassNotFoundException, SQLException{
		 return cd.getListCategory();
	 }
	// hàm thêm 1 loại sản phẩm
	public static void inserCategory(String mtl, String ttl) throws ClassNotFoundException, SQLException {
			cd.insertCategory(mtl, ttl);
	 }
	// hàm sửa tên 1 loại sản phẩm
	public static void updateCategoryType(String mtl, String ttl) throws ClassNotFoundException, SQLException {
		cd.update_ct(mtl, ttl);
	 }
	// hàm chọn 1 loại sản phẩmm
	public static Category get1CategoryType(String mtl) throws ClassNotFoundException, SQLException {
		 return cd.get1CategotyType(mtl);
	 }
	// hàm xóa 1 loại sản phẩm
	public void deletect(String mtl) throws SQLException, ClassNotFoundException {
		cd.deleteCt(mtl);
	}

}
