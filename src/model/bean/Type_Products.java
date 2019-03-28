/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : Feb 26, 2019 5:41:38 PM
*Description: Create by HCD-Fresher101
*Copyright (c) 2019 by HungPQ16. All rights reserved.
*/
package model.bean;

/**
 * @author HCD-Fresher101
 *
 */
public class Type_Products {
	public Type_Products(String idTypeProducts, String nameTypeP) {
		super();
		this.idTypeProducts = idTypeProducts;
		this.nameTypeP = nameTypeP;
	}
	public Type_Products() {}
	public String getIdTypeProducts() {
		return idTypeProducts;
	}
	public void setIdTypeProducts(String idTypeProducts) {
		this.idTypeProducts = idTypeProducts;
	}
	public String getNameTypeP() {
		return nameTypeP;
	}
	public void setNameTypeP(String nameTypeP) {
		this.nameTypeP = nameTypeP;
	}
	private String idTypeProducts;
	private String nameTypeP;

}
