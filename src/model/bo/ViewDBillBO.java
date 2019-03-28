/*
*
* (C) Copyright 2019 Italia.All Right Reserved
*project Name : TeddyShoes2
*author HCD-Fresher100
*@date 26 thg 2, 2019 23:30:54
*@version 1.0
*/
package model.bo;

import java.util.ArrayList;

import model.bean.ViewDBillBEAN;
import model.dao.ViewDBillDAO;

public class ViewDBillBO {
	ViewDBillDAO bd = new ViewDBillDAO();
	public ArrayList<ViewDBillBEAN> getAllDB()  throws Exception {
		return bd.getAllDB();
	}
	public ArrayList<ViewDBillBEAN> get1HD(int id) throws Exception {
		return bd.get1HD(id);
	}
}
