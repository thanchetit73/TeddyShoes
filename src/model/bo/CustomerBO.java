/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : 28 thg 2, 2019
*Description: Create by MyPC
*Copyright (c) 2019 by TeddyShoes. All rights reserved.
*/
package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Customer;
import model.dao.CustomerDAO;

/**
 * @author Long-TeddyShoes
 *
 */
public class CustomerBO {
	CustomerDAO kh = new CustomerDAO();
	// Hﾃ�m checkLogin dﾃｹng ki盻ノ tra ﾄ惰ハg nh蘯ｭp
		public Boolean checkLogin(String userName, String password)  {
			return kh.checkLogin(userName, password);
		}
		
	// hﾃ�m check trﾃｹng tﾃｪn ﾄ惰ハg nh蘯ｭp, email
		public boolean checkRole(String userName)  {
			return kh.checkRole(userName);
		}
	
		// hﾃ�m thﾃｪm - ﾄ惰ハg kﾃｽ tﾃ�i kho蘯｣n cho ngﾆｰ盻拱 dﾃｹng
		public void insertCustomer(Customer dk) throws SQLException {
			kh.insertCustomer(dk);
		}
		// hﾃ�m hi盻ハ th盻� toﾃ�n b盻� list tﾃ�i kho蘯｣n ngﾆｰ盻拱 dﾃｹng
		public ArrayList<Customer> getListCustomer() {
			return kh.getListCustomer();
		}
		// hﾃ�m hi盻ハ th盻� thﾃｴng tin admin
		public Customer getAdmin(String admin) {
			return kh.getAdmin(admin);
		}
		// xﾃｳa tﾃ�i kho蘯｣n ngﾆｰ盻拱 dﾃｹng
		public void delCustomer(String id) {
			kh.delCustomer(id);
		}
		// hﾃ�m get tﾃｪn hi盻ハ th盻�
		public String getName(String userName) {
			return kh.getName(userName);
		}
		// hﾃ�m set quy盻］ admin
		public void addAdmin(String userName) {
			kh.addAdmin(userName);
		}
		// hﾃ�m ki盻ノ tra trﾃｹng tﾃｪn tﾃ�i kho蘯｣n

		public boolean checkUserName(String userName) {
			return kh.checkUserName(userName);
		}
		// hﾃ�m ki盻ノ tra trﾃｹng email
		public boolean checkEmail(String userName) {
			return kh.checkEmail(userName);
		}
		// hﾃ�m s盻ｭa thﾃｴng tin admin
		public void suaAdmin(String userName, String showAdmin, String pass) {
			kh.suaAdmin(userName, showAdmin, pass);
		}
		// hﾃ�m check khi ﾄ惰ハg kﾃｽ trﾃｹng tﾃ�i kho蘯｣n v盻嬖 mail k dﾃｹng boolean
		public ArrayList<Customer> checkUserMail(String email, String userName) {
			return kh.checkUserMail(email, userName);
		}
		// hàm get thong tin theo id -- dùng cho review blog
				public Customer getCustomerById(String id) {
					return kh.getCustomerById(id);
				}
				
				public int getID(String tenDangNhap, String matKhau)  {
					return kh.getID(tenDangNhap, matKhau);
					
				}
	
}
