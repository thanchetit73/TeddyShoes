/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : Feb 26, 2019 5:24:10 PM
*Description: Create by HCD-Fresher101
*Copyright (c) 2019 by HungPQ16. All rights reserved.
*/
package model.bean;

/**
 * @author HCD-Fresher101
 *
 */
public class Products {

	public Products(String productId, String nameProduct, String typeId, int unitPrice, int promotionPrice,
			String image, String unit, int newProduct, String description) {
		super();
		this.productId = productId;
		this.nameProduct = nameProduct;
		this.typeId = typeId;
		this.unitPrice = unitPrice;
		this.promotionPrice = promotionPrice;
		this.image = image;
		this.unit = unit;
		this.newProduct = newProduct;
		this.description = description;
	}
	public Products(String nameProduct, String typeId, int unitPrice, int promotionPrice,
			String image, String unit, int newProduct, String description) {
		super();
		//this.productId = productId;
		this.nameProduct = nameProduct;
		this.typeId = typeId;
		this.unitPrice = unitPrice;
		this.promotionPrice = promotionPrice;
		this.image = image;
		this.unit = unit;
		this.newProduct = newProduct;
		this.description = description;
	}
	public Products() {}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	public int getPromotionPrice() {
		return promotionPrice;
	}
	public void setPromotionPrice(int promotionPrice) {
		this.promotionPrice = promotionPrice;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getNewProduct() {
		return newProduct;
	}
	public void setNewProduct(int newProduct) {
		this.newProduct = newProduct;
	}
	/**
	 * @return the nameProduct
	 */
	public String getNameProduct() {
		return nameProduct;
	}
	/**
	 * @param nameProduct the nameProduct to set
	 */
	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	private String productId;
	private String nameProduct;
	private String typeId;
	private int unitPrice;
	private int promotionPrice;
	private String image;
	private String unit;
	private int newProduct;
	private String description;

}
