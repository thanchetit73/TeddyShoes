/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : 4 thg 3, 2019
*Description: Create by MyPC
*Copyright (c) 2019 by TeddyShoes. All rights reserved.
*/
package model.bean;

/**
 * @author MyPC
 *
 */
public class Statistical {
	private String nameProduct;
	private String type;
	private String quantity;
	/**
	 * 
	 */
	public Statistical() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param nameProduct
	 * @param type
	 * @param quantity
	 */
	public Statistical(String nameProduct, String type, String quantity) {
		super();
		this.nameProduct = nameProduct;
		this.type = type;
		this.quantity = quantity;
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
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * @return the quantity
	 */
	public String getQuantity() {
		return quantity;
	}
	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	

}
