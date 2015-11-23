package com.stock.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

import com.stock.model.DBConnection;
import com.stock.model.Gainer;
import com.stock.model.Loser;

import com.stock.model.StockPrice;

import com.stock.model.DashboardCommodity;
import com.stock.model.MyProfile;
import com.stock.model.PopularStock;

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
	public List<StockPrice> readStockPrice()
	{
		Connection con = DBConnection.getConnection();
		String sql ="select * from mytable order by date asc";
		List<StockPrice> spList = new ArrayList<StockPrice>();
		try{

			PreparedStatement stmnt = con.prepareStatement(sql);
			ResultSet rs = stmnt.executeQuery();
			while(rs.next())
			{
				System.out.println("reading for "+rs.getString("name"));
				StockPrice sp = new StockPrice();
				sp.setDate(rs.getString("date"));
				sp.setName(rs.getString("name"));
				sp.setPrice(Integer.parseInt(rs.getString("price")));
				spList.add(sp);

			}
			return spList;
		}
		catch(Exception e)
		{
			System.out.println("Error");
		}
		return spList;


	}
	public ArrayList<MyProfile> readMyProfileGain()
	{
		Connection con = DBConnection.getConnection();
		ArrayList<MyProfile> list = new ArrayList<MyProfile>();
		try{
			PreparedStatement readData = null;

			String readGain = "SELECT COMPANY,PERCENTCHANGE FROM MyProfile WHERE USERNAME='134953'"
					+ "AND GAIN = 1";
			System.out.println("inside dbconnection readMyProfileGain");
			readData = con.prepareStatement(readGain);

			ResultSet rs= readData.executeQuery();	
			while(rs.next()){
				MyProfile gain = new MyProfile();
				gain.setCompany(rs.getString("COMPANY"));
				gain.setPercentChange(rs.getInt("PERCENTCHANGE"));
				list.add(gain);
				//System.out.println("COMPANY:"+rs.getString("COMPANY"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;

	}
	public ArrayList<MyProfile> readMyProfileLoss()
	{
		Connection con = DBConnection.getConnection();
		ArrayList<MyProfile> list = new ArrayList<MyProfile>();
		try{
			PreparedStatement readData = null;

			String readGain = "SELECT COMPANY,PERCENTCHANGE FROM MyProfile WHERE USERNAME='134953'"
					+ "AND GAIN = 0";
			//System.out.println("inside dbconnection readMyProfileLoss");
			readData = con.prepareStatement(readGain);

			ResultSet rs= readData.executeQuery();	
			while(rs.next()){
				MyProfile gain = new MyProfile();
				gain.setCompany(rs.getString("COMPANY"));
				gain.setPercentChange(rs.getInt("PERCENTCHANGE"));
				list.add(gain);
				//System.out.println("COMPANY:"+rs.getString("COMPANY"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;	
	}
	public ArrayList<MyProfile> readMyProfile()
	{
		Connection con = DBConnection.getConnection();
		ArrayList<MyProfile> list = new ArrayList<MyProfile>();
		try{
			PreparedStatement readData = null;

			String readGain = "SELECT COMPANY,PERCENTCHANGE,GAIN FROM MyProfile WHERE USERNAME='134953'";
			//System.out.println("inside dbconnection readMyProfile");
			readData = con.prepareStatement(readGain);

			ResultSet rs= readData.executeQuery();	
			while(rs.next()){
				MyProfile myprofile = new MyProfile();
				myprofile.setCompany(rs.getString("COMPANY"));
				if(rs.getBoolean("GAIN")){
					myprofile.setPercentChange(rs.getInt("PERCENTCHANGE"));
				}else{
					myprofile.setPercentChange(rs.getInt("PERCENTCHANGE")* -1);	
				}
				list.add(myprofile);
				//System.out.println("COMPANY:"+rs.getString("COMPANY"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;	
	}
	public ArrayList<PopularStock> readPopularStock()
	{
		Connection con = DBConnection.getConnection();
		ArrayList<PopularStock> list = new ArrayList<PopularStock>();
		try{
			PreparedStatement readData = null;

			String readGain = "SELECT COMPANY,PRICE FROM PopularStocks";
			//System.out.println("inside dbconnection readPopularStock");
			readData = con.prepareStatement(readGain);

			ResultSet rs= readData.executeQuery();	
			while(rs.next()){
				PopularStock popularStock = new PopularStock();
				popularStock.setCompanyName(rs.getString("COMPANY"));
				popularStock.setPrice(rs.getInt("PRICE"));	
				list.add(popularStock);
				//System.out.println("COMPANY:"+rs.getString("COMPANY"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;	
	}
	public ArrayList<DashboardCommodity> readDashboardCommodities()
	{
		Connection con = DBConnection.getConnection();
		ArrayList<DashboardCommodity> list = new ArrayList<DashboardCommodity>();
		try{
			PreparedStatement readData = null;

			String readGain = "SELECT COMMODITY,PRICE FROM DashboardCommodities";
			System.out.println("inside dbconnection readDashboardCommodities");
			readData = con.prepareStatement(readGain);

			ResultSet rs= readData.executeQuery();	
			while(rs.next()){
				DashboardCommodity dashboardCommodity = new DashboardCommodity();
				dashboardCommodity.setCommodity(rs.getString("COMMODITY"));
				dashboardCommodity.setPrice(rs.getInt("PRICE"));	
				list.add(dashboardCommodity);
				System.out.println("COMMODITY:"+rs.getString("COMMODITY"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;	

	}
}
