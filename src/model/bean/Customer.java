/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : 28 thg 2, 2019
*Description: Create by MyPC
*Copyright (c) 2019 by TeddyShoes. All rights reserved.
*/
package model.bean;

/**
 * @author Long-TeddyShoes
 *
 */
public class Customer {
	/**
	 * @param customerId
	 * @param userName
	 * @param password
	 * @param email
	 * @param showName
	 * @param avatar
	 * @param type
	 */
	public Customer( String userName, String password, String email, String showName, String avatar,
			int type) {
		super();
		//this.customerId = customerId;
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.showName = showName;
		this.avatar = avatar;
		this.type = type;
	}
	public Customer() {}
	/**
	 * @return the customerId
	 */
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the showName
	 */
	public String getShowName() {
		return showName;
	}
	/**
	 * @param showName the showName to set
	 */
	public void setShowName(String showName) {
		this.showName = showName;
	}
	/**
	 * @return the gender
	 */
	public String getAvatar() {
		return avatar;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	/**
	 * @param gender the gender to set
	 */
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	/**
	 * @return the type
	 */
	public int getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(int type) {
		this.type = type;
	}
	private String userId;
	private String userName;
	private String password;
	private String email;
	private String showName;
	private String avatar;
	private int type;

}
