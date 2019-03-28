/*
*
* (C) Copyright 2019 Italia.All Right Reserved
*project Name : TeddyShoes2
*author HCD-Fresher100
*@date 28 thg 2, 2019 18:12:48
*@version 1.0
*/
package model.bo;

import java.util.ArrayList;

import model.bean.ViewBEAN;
import model.dao.ViewDAO;

public class ViewBO {
       ViewDAO vd = new ViewDAO();
       public ArrayList<ViewBEAN> getAll() throws Exception{
    	   return vd.getAll();
       }
       public int Xoa(int bill_id) throws Exception {
    	   return vd.Xoa(bill_id);
       }

}
