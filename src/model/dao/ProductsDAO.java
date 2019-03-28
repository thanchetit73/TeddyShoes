/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : Feb 26, 2019 8:29:24 PM
*Description: Create by HCD-Fresher101
*Copyright (c) 2019 by HungPQ16. All rights reserved.
*/
package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.bean.Products;

/**
 * @author HCD-Fresher101
 *
 */
public class ProductsDAO {
	// hàm get toàn bộ sản phẩm theo mã loại sản phẩm
		public ArrayList<Products> getProductsById(String typeId1){
			ArrayList<Products> lstP = new ArrayList<Products>();
			CoSo cs = new CoSo();
			try {
				cs.KetNoi();
				String sql = " SELECT * FROM Products WHERE type_Id=?";
				PreparedStatement cmd = cs.cn.prepareStatement(sql);
				cmd.setString(1, typeId1);
				ResultSet rs = cmd.executeQuery();
				while(rs.next()) {
					String productId = rs.getString("product_id");
					String nameProduct = rs.getString("name");
					String typeId = rs.getString("type_Id");
					String description = rs.getString("description");
					int unitPrice = rs.getInt("unit_price");
					int promotionPrice = rs.getInt("promotion_price");
					String image = rs.getString("image");
					String unit = rs.getString("unit");
					int newProduct = rs.getInt("new");
					Products s = new Products(productId, nameProduct, typeId, unitPrice, promotionPrice, image, unit, newProduct, description);
					lstP.add(s);
				}
				rs.close();
				cs.cn.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
			return lstP;		
		}
	
	// hàm get toàn bộ sản phẩm
	public ArrayList<Products> getAllProDucts(){
		ArrayList<Products> lstP = new ArrayList<Products>();
		CoSo cs = new CoSo();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM Products";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while(rs.next()) {
				String productId = rs.getString("product_id");
				String nameProduct = rs.getString("name");
				String typeId = rs.getString("type_Id");
				String description = rs.getString("description");
				int unitPrice = rs.getInt("unit_price");
				int promotionPrice = rs.getInt("promotion_price");
				String image = rs.getString("image");
				String unit = rs.getString("unit");
				int newProduct = rs.getInt("new");
				Products s = new Products(productId, nameProduct, typeId, unitPrice, promotionPrice, image, unit, newProduct, description);
				lstP.add(s);
			}
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return lstP;		
	}
	// hàm thêm sản phẩm
		public void insertProducts(Products pd) {
			CoSo cs = new CoSo();
			int kq=0;
			try {
				cs.KetNoi();
				String sql = "INSERT INTO Products VALUES (?,?,?,?,?,?,?,?)";
				PreparedStatement cmd = cs.cn.prepareStatement(sql);
				cmd.setString(1, pd.getNameProduct());
				cmd.setString(2, pd.getTypeId());
				cmd.setString(3, pd.getDescription());
				cmd.setInt(4, pd.getUnitPrice());
				cmd.setInt(5, pd.getPromotionPrice());
				cmd.setString(6, pd.getImage());
				cmd.setString(7,pd.getUnit());
				cmd.setInt(8, pd.getNewProduct());
				 kq = cmd.executeUpdate();
				cmd.close();
				cs.cn.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		//hàm get chọn 1 sản phẩm
		public Products get1Products(String productId){
			Products ds = null; 
			CoSo cs = new CoSo();
			try {
				cs.KetNoi();
				String sql ="select * from Products where product_Id=?";
				PreparedStatement cmd = cs.cn.prepareStatement(sql);
				cmd.setString(1, productId);
				ResultSet rs = cmd.executeQuery();
				while(rs.next()) {
							
					String nameProduct = rs.getString("name");
					String typeId = rs.getString("type_Id");
					String description = rs.getString("description");
					int unitPrice = rs.getInt("unit_price");
					int promotionPrice = rs.getInt("promotion_price");
					String image = rs.getString("image");
					String unit = rs.getString("unit");
					int newProduct = rs.getInt("new");
					ds = new Products(productId, nameProduct, typeId, unitPrice, promotionPrice, image, unit, newProduct, description);
				}
				rs.close();
				cs.cn.close();
			}catch (Exception e) {
				// TODO: handle exception
			}
			System.out.println(ds.getProductId()+"kkkk");
			return ds;
		}
		
		// hàm sửa 1 sản phẩm
		public int updateProducts(String productId, String nameProduct, String typeId, int unitPrice, int promotionPrice,
				String image, String unit, int newProduct, String description) 
				throws Exception{		
			CoSo cs = new CoSo();
			int kq=0;
			try {
				cs.KetNoi();
				String sql ="UPDATE Products set name=?,type_Id=?,description=?,unit_price=?,promotion_price=?,image=?,unit=?,new=? WHERE product_Id=? ";
				PreparedStatement cmd = cs.cn.prepareStatement(sql);
				cmd.setString(1, nameProduct);
				cmd.setString(2, typeId);
				cmd.setString(3, description);
				cmd.setInt(4, unitPrice);
				cmd.setInt(5, promotionPrice);			
				cmd.setString(6, image);
				cmd.setString(7, unit);
				cmd.setInt(8, newProduct);	
				 kq =cmd.executeUpdate();
				cmd.close();
				cs.cn.close();
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return kq;
		}
		// hàm xóa 1 sản phẩm theo mã
		public int del1Products(String productId) throws Exception
		{
			CoSo cs = new CoSo();
			cs.KetNoi();
			String sql="delete from Products where product_Id=?";
			PreparedStatement cmd =cs.cn.prepareStatement(sql);		
			cmd.setString(1, productId);
			int kq= cmd.executeUpdate();
			cs.cn.close();
			return kq;

	}
		// search
		public ArrayList<Products> getSearch(String name){
			ArrayList<Products> lstP = new ArrayList<Products>();
			CoSo cs = new CoSo();
			try {
				cs.KetNoi();
				String sql = " SELECT * FROM Products WHERE name LIKE '%?%' ";
				PreparedStatement cmd = cs.cn.prepareStatement(sql);
				cmd.setString(1, name);
				ResultSet rs = cmd.executeQuery();
				while(rs.next()) {
					String productId = rs.getString("product_id");
					String nameProduct = rs.getString("name");
					String typeId = rs.getString("type_Id");
					String description = rs.getString("description");
					int unitPrice = rs.getInt("unit_price");
					int promotionPrice = rs.getInt("promotion_price");
					String image = rs.getString("image");
					String unit = rs.getString("unit");
					int newProduct = rs.getInt("new");
					Products s = new Products(productId, nameProduct, typeId, unitPrice, promotionPrice, image, unit, newProduct, description);
					lstP.add(s);
				}
				rs.close();
				cs.cn.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
			return lstP;		
		}
		
	

}
