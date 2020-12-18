package com.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.Employee.DBConnect;

public class LoginDBUtil {

	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	
	//SQL Query to get info about the customer
	
	
	
	
	//Check the Customer Login Credentials
	public boolean checkEmployee(String id, String password)
	{
		
		
		String sql2 = "SELECT *  FROM employee.employee WHERE emp_id ='"+id+"' AND password = '"+password+"'";
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			Class.forName("com.mysql.jdbc.Driver");
			
			rs = stmt.executeQuery(sql2);
			
			
			if(rs.next())
			{
				return true;
			}
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	//Check Admin Login Credentials
		public boolean checkAdmin(String id, String password)
		{
			
			String sql1 = "SELECT * FROM employee.admin WHERE id = '"+id+"' AND password = '"+password+"'";
			try {
				con = DBConnect.getConnection();
				stmt = con.createStatement();
				Class.forName("com.mysql.jdbc.Driver");
				
				rs = stmt.executeQuery(sql1);
				if(rs.next())
				{
					return true;
				}
				
				con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return false;
		}
}
