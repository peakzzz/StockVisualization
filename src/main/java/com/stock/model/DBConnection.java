package com.stock.model;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

public class DBConnection {
	

	private DBConnection(){}
	private static Connection con;
	
	private static DataSource dataSource;
	
	public void setDataSource(DataSource dataSrc)
	{
		try {
			System.out.println("conect ***************" + dataSrc.getConnection());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.dataSource = dataSrc;
	}
	public static DataSource getDataSource(){
		return dataSource;
	}
	

	public static Connection getConnection()
	{
		try {
			if(con == null){
				con = dataSource.getConnection();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
}
