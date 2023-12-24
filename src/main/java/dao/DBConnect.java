package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import common.ConfigDB;

public class DBConnect {
	Connection connect;
	
	public  Connection getConnection() throws SQLException{
		try {
			Class.forName(ConfigDB.DRIVER_CLASS);
			connect = DriverManager.getConnection(ConfigDB.URL+"/"+ConfigDB.DB_NAME,ConfigDB.USERNAME, ConfigDB.PASSWORD);
			return connect;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	public void executeUpdate(String sql) throws Exception{
		Connection connect =getConnection();
		PreparedStatement ps = connect.prepareStatement(sql);
		ps.executeUpdate();
		
	}
	public ResultSet executeQuery(String sql) throws Exception{
		Connection connect =getConnection();
		PreparedStatement ps = connect.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		return rs;
	}
	public void remove() {
		try {
			connect.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) throws Exception  {
		try {
			DBConnect db = new DBConnect();
			System.out.println(db.getConnection());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
