/*
*
* (C) Copyright 2019 Italia.All Right Reserved
*project Name : TeddyShoes2
*author HCD-Fresher100
*@date 28 thg 2, 2019 22:30:53
*@version 1.0
*/
package model.bean;

public class ViewDBillBEAN {
	   private int bill_Id;
	    private String userName;
	    private String product;
	    private int quantity;
	    private float unit_Price;
		public ViewDBillBEAN(int bill_Id, String userName, String product, int quantity, float unit_Price) {
			super();
			this.bill_Id = bill_Id;
			this.userName = userName;
			this.product = product;
			this.quantity = quantity;
			this.unit_Price = unit_Price;
		}
		public ViewDBillBEAN() {}
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
		public String getProduct() {
			return product;
		}
		public void setProduct(String product) {
			this.product = product;
		}
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		public float getUnit_Price() {
			return unit_Price;
		}
		public void setUnit_Price(float unit_Price) {
			this.unit_Price = unit_Price;
		}  
		
	
}
