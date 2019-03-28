/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : Feb 26, 2019 10:17:25 PM
*Description: Create by HCD-Fresher101
*Copyright (c) 2019 by HungPQ16. All rights reserved.
*/
package model.bo;

import java.util.ArrayList;

import model.bean.Products;
import model.dao.ProductsDAO;

/**
 * @author HCD-Fresher101
 *
 */
public class ProductsBO {
	// Gọi lại ProductsDAO
	ProductsDAO lst = new ProductsDAO();
	// hàm get toàn bộ sản phẩm
		public ArrayList<Products> getAllProDucts(){
			return lst.getAllProDucts();
		}
		// hàm thêm sản phẩm
		public void insertProducts(Products pd) {	
			 lst.insertProducts(pd);
		}
		// hàm get toàn bộ sản phẩm
		public ArrayList<Products> getProductsById(String typeId1) {
			return lst.getProductsById(typeId1);
		}

	// hàm get chọn 1 sản phẩm
		public Products get1Products(String productId) {
			return lst.get1Products(productId);
		}
		// hàm sửa 1 sản phẩm
		public int updateProducts(String productId, String nameProduct, String typeId, int unitPrice, int promotionPrice,
				String image, String unit, int newProduct, String description) throws Exception{		
			return lst.updateProducts(productId, nameProduct, typeId, unitPrice, promotionPrice, image, unit, newProduct, description);
		}
		// hàm xóa 1 sản phẩm theo mã
		public int del1Products(String productId) throws Exception	{
			return lst.del1Products(productId);
		}
		// search
		public ArrayList<Products> getSearch(String name){
			return lst.getSearch(name);
		}

}
