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
import java.sql.SQLException;

/**
 * @author PhuongBT
 *
 */
public class DB {
	public static Connection getSQLServerConnection()
	         throws SQLException, ClassNotFoundException {
		String hostName = "localhost";
		String sqlInstanceName = "SQLEXPRESS";
		String database = "QLSHOPTEDDY";
		String userName = "sa";
		String password = "123";
	     return  getSQLServerConnection(hostName, sqlInstanceName,
	             database, userName, password) ;
	    	 
	     
	 }
	 
	 public static Connection getSQLServerConnection(String hostName,
	         String sqlInstanceName, String database, String userName,
	         String password) throws ClassNotFoundException, SQLException {
		 
	     Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	     String connectionURL = "jdbc:sqlserver://" + hostName + ":1433"
	             + ";instance=" + sqlInstanceName + ";databaseName=" + database;
	     Connection conn = DriverManager.getConnection(connectionURL, userName,
	             password);
	     return conn;
	     
	 }

}
