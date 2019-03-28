/*
*
* (C) Copyright 2019 Italia.All Right Reserved
*project Name : TeddyShoes2
*author HCD-Fresher100
*@date 28 thg 2, 2019 17:47:33
*@version 1.0
*/
package model.bean;

import java.util.Date;

public class ViewBEAN {
    public int bill_Id;
    public String userName;
    public String address;
    public int Phone_Number;
    public String email;
    public String product;
    public Date date_Order;
    
	public int getBill_Id() {
		return bill_Id;
	}
	public void setBill_Id(int bill_Id) {
		this.bill_Id = bill_Id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPhone_Number() {
		return Phone_Number;
	}
	public void setPhone_Number(int phone_Number) {
		Phone_Number = phone_Number;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public Date getDate_Order() {
		return date_Order;
	}
	public void setDate_Order(Date date_Order) {
		this.date_Order = date_Order;
	}
	public ViewBEAN(int bill_Id, String userName, String address, int phone_Number, String email, String product,
			Date date_Order) {
		super();
		this.bill_Id = bill_Id;
		this.userName = userName;
		this.address = address;
		Phone_Number = phone_Number;
		this.email = email;
		this.product = product;
		this.date_Order = date_Order;
	}
	
	public ViewBEAN() {
		super();
	}
}
