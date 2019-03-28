/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : 28 thg 2, 2019
*Description: Create by MyPC
*Copyright (c) 2019 by TeddyShoes. All rights reserved.
*/
package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Customer;

/**
 * @author MyPC
 *
 */
public class CustomerDAO {
	
	String url = "jdbc:sqlserver://localhost:1433;databaseName=QLSHOPTEDDY";
	String userName = "sa";
	String password = "123";
	Connection connection;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	// hàm kết nối
	void connect(){
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			connection = DriverManager.getConnection(url, userName, password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// hàm get thong tin theo id -- dùng cho review blog
	public Customer getCustomerById(String id) {
		connect();
		String sql=	"SELECT * from Customer where customer_Id = '"+id+"'";
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		Customer kh = null;
		try {
			while(rs.next()){
				kh = new Customer();
				kh.setUserName(rs.getString("username"));
				kh.setEmail(rs.getString("email"));
				kh.setShowName(rs.getString("showname"));
				kh.setAvatar(rs.getString("avatar"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return kh;
	}
	// Hàm checkLogin dùng kiểm tra đăng nhập
	public Boolean checkLogin(String tenDangNhap, String matKhau)  {
		connect();
		Customer cus = new Customer();
		try {
			pstmt = connection.prepareStatement("SELECT * from Customer where (email = ? OR username = ?) and password = ?");
			pstmt.setString(1, tenDangNhap);
			pstmt.setString(2, tenDangNhap);
			pstmt.setString(3, matKhau);
			rs = pstmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			if(rs.next()){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
	// hàm check trùng tên đăng nhập, email
	public boolean checkRole(String userName)  {
		connect();
		int role = 0;
		try {
			pstmt = connection.prepareStatement("SELECT * from Customer where username = ? or email =?");
			pstmt.setString(1, userName);
			pstmt.setString(2, userName);
			rs = pstmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			while (rs.next()) {
				 role = rs.getInt("type");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(role == 1) {
			return true;
		}
		return false;
	}
	
	// hàm thêm - đăng ký tài khoản cho người dùng
	public void insertCustomer(Customer dk) throws SQLException {
		connect();
		String sql = String.format("INSERT INTO Customer(username,password,email,showname,type,avatar) " + 
		" VALUES (?,?,?,?,?,?)");
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, dk.getUserName());
			pstmt.setString(2, dk.getPassword());
			pstmt.setString(3, dk.getEmail());
			pstmt.setString(4, dk.getShowName());
			pstmt.setInt(5, dk.getType());
			pstmt.setString(6, dk.getAvatar());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connection.close();
		}
	}
	// hàm hiển thị toàn bộ list tài khoản người dùng
	public ArrayList<Customer> getListCustomer() {
		connect();
		String sql=	"SELECT * from Customer where type= 0";
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ArrayList<Customer> list = new ArrayList<Customer>();
		Customer kh;
		try {
			while(rs.next()){
				kh = new Customer();
				kh.setUserName(rs.getString("username"));
				kh.setEmail(rs.getString("email"));
				kh.setShowName(rs.getString("showname"));
				kh.setAvatar(rs.getString("avatar"));
				list.add(kh);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	// hàm hiển thị thông tin admin
	public Customer getAdmin(String admin) {
		connect();
		String sql=	"SELECT * from Customer where username = '"+admin+"'";
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		Customer kh = null;
		try {
			while(rs.next()){
				kh = new Customer();
				kh.setUserName(rs.getString("username"));
				kh.setEmail(rs.getString("email"));
				kh.setShowName(rs.getString("showname"));
				kh.setAvatar(rs.getString("avatar"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return kh;
	}
	// xóa tài khoản người dùng
	public void delCustomer(String id) {
		connect();
		String sql=	String.format("DELETE FROM Customer WHERE customer_id = '%s'", id);
		try {
			Statement stmt = connection.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	// hàm get tên hiển thị
	public String getName(String userName) {
		connect();
		String sql = "SELECT * from Customer where username = '" + userName + "' or email ='"+userName+"'";
		ResultSet rs = null;
		String name = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			while (rs.next()) {
				name = rs.getString("showname");

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return name;
	}
	// hàm set quyền admin
	public void addAdmin(String userName) {
		connect();
		String sql = String.format("UPDATE Customer " + " SET type= 1" + " WHERE username = '%s'", userName);
		try {
			Statement stmt = connection.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	// hàm sửa thông tin admin
	public void suaAdmin(String userName, String showAdmin, String pass) {
		connect();
		String sql = String.format(
				"UPDATE Customer " + " SET  showname = '%s', password = '%s' " + " WHERE username = '%s'", showAdmin,
				pass, userName);
		try {
			Statement stmt = connection.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	// hàm kiểm tra trùng tên tài khoản

	public boolean checkUserName(String userName) {
		connect();
		String sql = "SELECT * from Customer where username ='" + userName +"'";
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			if(rs.next()){
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
			return true;
		
	}
	// hàm kiểm tra trùng email
	public boolean checkEmail(String userName) {
		connect();
		String sql = "SELECT * from Customer where  email='"+userName+"'";
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			if(rs.next()){
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return  true;
		
	}
	// hàm void check email vs tai khoan khi dang ky 
		public ArrayList<Customer> checkUserMail(String email, String userName) {
			connect();
			String sql=	"SELECT * from Customer where username =? or email =?";
			ResultSet rs = null;
			try {
				Statement stmt = connection.createStatement();
				pstmt.setString(1, userName);
				pstmt.setString(2, email);
				rs = stmt.executeQuery(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			ArrayList<Customer> list = new ArrayList<Customer>();
			Customer kh;
			try {
				while(rs.next()){
					kh = new Customer();
					kh.setUserName(rs.getString("username"));
					kh.setEmail(rs.getString("email"));
					kh.setShowName(rs.getString("showname"));
					kh.setAvatar(rs.getString("avatar"));
					list.add(kh);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return list;
		}

	
		public int getID(String tenDangNhap, String matKhau)  {
			
			connect();
			String sql="SELECT * from Customer where (email = ? OR username = ?) and password = ?";
			int id = 0;
			try {
				pstmt = connection.prepareStatement(sql);
				pstmt.setString(1, tenDangNhap);
				pstmt.setString(2, tenDangNhap);
				pstmt.setString(3, matKhau);
				rs = pstmt.executeQuery();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			try {
				if(rs.next()){
					id = rs.getInt("customer_id");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return id;
		}


}
