/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : Feb 26, 2019 5:34:32 PM
*Description: Create by HCD-Fresher101
*Copyright (c) 2019 by HungPQ16. All rights reserved.
*/
package model.dao;
import java.sql.*;

public class CoSo {
	public Connection cn;
	public void KetNoi() throws Exception{
		// Xac dinh he quan tri co so du lieu
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			cn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=QLSHOPTEDDY;user=sa;password=123");
	}
}

