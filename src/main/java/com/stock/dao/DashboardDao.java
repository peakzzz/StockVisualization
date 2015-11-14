package com.stock.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

import com.stock.model.DBConnection;
import com.stock.model.Gainer;
import com.stock.model.Loser;

public class DashboardDao {
	private DataSource dataSource;
	
	@Autowired
	public void setDataSource(DataSource datasource){
		this.dataSource = datasource;
	}
	public ArrayList<Gainer> readGainer()
	{
		Connection con = DBConnection.getConnection();
		ArrayList<Gainer> list = new ArrayList<Gainer>();
		try{
		PreparedStatement readData = null;
		
		String readGain = "SELECT COMPANY,PERCENTCHANGE FROM Gainer";
			System.out.println("inside dbconnection read");
			readData = con.prepareStatement(readGain);
			//readData.setString(1, UserId);
			ResultSet rs= readData.executeQuery();	
			while(rs.next()){
				Gainer Gainer = new Gainer();
				Gainer.setName(rs.getString("COMPANY"));
				Gainer.setPercentChange(rs.getInt("PERCENTCHANGE"));
				list.add(Gainer);
				System.out.println("COMPANY:"+rs.getString("COMPANY"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	public ArrayList<Loser> readLoser()
	{
		Connection con = DBConnection.getConnection();
		ArrayList<Loser> list = new ArrayList<Loser>();
		try{
		PreparedStatement readData = null;
		
		String readGain = "SELECT COMPANY,PERCENTCHANGE FROM Loser";
			System.out.println("inside dbconnection read");
			readData = con.prepareStatement(readGain);
			//readData.setString(1, UserId);
			ResultSet rs= readData.executeQuery();	
			while(rs.next()){
				Loser loser = new Loser();
				loser.setName(rs.getString("COMPANY"));
				loser.setPercentChange(rs.getInt("PERCENTCHANGE"));
				list.add(loser);
				System.out.println("COMPANY:"+rs.getString("COMPANY"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
}
