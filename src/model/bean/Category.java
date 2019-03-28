/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : 28 thg 2, 2019
*Description: Create by PhuongBT-TeddyShoes
*Copyright (c) 2019 by TeddyShoes. All rights reserved.
*/
package model.bean;

/**
 * @author PhuongBT-TeddyShoes
 *
 */
public class Category {
	/**
	 * @param type_ID
	 * @param type_Name
	 */
	public Category(String type_ID, String type_Name) {
		super();
		this.type_ID = type_ID;
		this.type_Name = type_Name;
	}
	public Category() {}
	/**
	 * @return the type_ID
	 */
	public String getType_ID() {
		return type_ID;
	}
	/**
	 * @param type_ID the type_ID to set
	 */
	public void setType_ID(String type_ID) {
		this.type_ID = type_ID;
	}
	/**
	 * @return the type_Name
	 */
	public String getType_Name() {
		return type_Name;
	}
	/**
	 * @param type_Name the type_Name to set
	 */
	public void setType_Name(String type_Name) {
		this.type_Name = type_Name;
	}
	private String type_ID;
	private String type_Name;

}
