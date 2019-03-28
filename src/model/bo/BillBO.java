/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : 4 thg 3, 2019
*Description: Create by MyPC
*Copyright (c) 2019 by TeddyShoes. All rights reserved.
*/
package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import model.dao.BillDAO;
import model.bean.Bill;
import model.bean.Statistical;
/**
 * @author MyPC
 *
 */
public class BillBO {
	BillDAO billdao = new BillDAO();
	// thong ke theo thoi gian
	public int getTotal(String tungay,String denngay) throws ClassNotFoundException, SQLException {
		return billdao.getTotal(tungay, denngay);
		
	}
	// thong ke theo so luong
	public ArrayList<Statistical> getThongKeSL(String tungay,String denngay) throws ClassNotFoundException, SQLException {
		return billdao.getThongKeSL(tungay, denngay);
		
	}
	// thong ke theo gia san pham
	public ArrayList<Statistical> getThongKeGiaTien(String tugia,String dengia) throws ClassNotFoundException, SQLException {
		return billdao.getThongKeGiaTien(tugia, dengia);
		
	}
	
	// hàm chi tiest bill
		public ArrayList<Bill> getBillByID(String id) throws ClassNotFoundException {
			return billdao.getBillByID(id);
		}
}
