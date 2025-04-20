package com.aastra.controller.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect{
	private final static String databaseName = "aastra";
	private final static String username = "root";
	private final static String password = "";
	private final static String jdbcURL = "jdbc:mysql://localhost:3306/" + databaseName;
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(jdbcURL, username, password);
	}	
	
}

