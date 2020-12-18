package com.Leave;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.Employee.DBConnect;
import com.Employee.Employee;
import com.service.Service;

public class LeaveDBUtil implements Service{


	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//inserting the values to the leave table
 public  boolean insertLeave(String ID, String reason, String FromDate, String ToDate , String status) {
	    	
	    	boolean isSuccess = false;
	    	
	    	try {
	    		con = DBConnect.getConnection();
	    		stmt = con.createStatement();
	    		//Sql querry in inserting the recieved details to the database
	    	    String sql = "insert into employee.leaves values (0,'"+reason+"','"+FromDate+"','"+ToDate+"','"+status+"', '"+ID+"')";
	    		int rs = stmt.executeUpdate(sql);
	    		
	    		if(rs > 0) {
	    			isSuccess = true;
	    		} else {
	    			isSuccess = false;
	    		}
	    		
	    	}
	    	catch (Exception e) {
	    		e.printStackTrace();
	    	}
	 	
	    	return isSuccess;
	    }
 
//updating the values to the leave table
 public boolean updateLEave(String ID, String reason, String FromDate, String ToDate , String status) {
	 	
	 	
	 	boolean isSuccess = false;
	 	
	     	try {//testing database connection
	     		con = DBConnect.getConnection();
	     		stmt = con.createStatement();
	     		//Sql querry in updating the recieved details to the database
	     		String sql = "update employee.leaves set Reason='"+reason+"',FromDate='"+FromDate+"',ToDate='"+ToDate+"',Status ='"+status+"'"
	     				+ "where EmpId='"+ID+"'";
	     		int rs = stmt.executeUpdate(sql);
	     		
	     		if(rs > 0) {
	     			isSuccess = true;
	     		}
	     		else {
	     			isSuccess = false;
	     		}
	     		
	     		}
	     	catch(Exception e) {
	     		e.printStackTrace();
	     	}
	     	
	     	return isSuccess;
	     }
 
//deleting the values from the leave table
 public boolean DeleteLeave(String id) {
	 	
	 	
	 	boolean isSuccess = false;
	 	
	     	try {
	     		//testing database connection
	     		con = DBConnect.getConnection();
	     		stmt = con.createStatement();
	     		//Sql querry in deleting  the  details from the database
	     		String sql = "delete from  employee.leaves where EmpId='"+id+"'";
	     		int rs = stmt.executeUpdate(sql);
	     		
	     		if(rs > 0) {
	     			isSuccess = true;
	     		}
	     		else {
	     			isSuccess = false;
	     		}
	     		
	     		}
	     	catch(Exception e) {
	     		e.printStackTrace();
	     	}
	     	
	     	return isSuccess;
	     }
	 
 
 
 public  List<Leave> validate(String id) {
 	
 	ArrayList<Leave> leave = new ArrayList<>();
 	
 	//create database connection
 	String url = "jdbc:mysql://localhost:3306/employee";
 	String user = "root";
 	String pass = "";
 	
 	//validate
 	
 	try {
 	    
 	    Class.forName("com.mysql.jdbc.Driver");
 	    
 	    Connection con = DriverManager.getConnection(url, user, pass);
 	    Statement stmt = con.createStatement();
 	    String sql = "select * from employee.leaves where EmpID='"+id+"' ";	    
 	    ResultSet rs = stmt.executeQuery(sql);
 	    
 	    //getting the values from the databse
 	    if(rs.next()) {
 	    String Id = rs.getString(1);
 		String Reason = rs.getString(2);
 		String FromDate = rs.getString(3);
 		String ToDate = rs.getString(4);
 		String Status = rs.getString(5);
 		String EmpID = rs.getString(6);
 		
 		
 		//sending the recieved from the databse to the overloaded constructor
 		Leave c = new Leave(Id, Reason, FromDate, ToDate, Status);
 		leave.add(c);
 	    }
 	    
 	}
 	catch(Exception e) {
 	    e.printStackTrace();
 	}
 	
 	return leave;
 	
    }

@Override
public boolean insertannouncement(String id, String message, String cusiD) {
	// TODO Auto-generated method stub
	return false;
}

@Override
public boolean updateannouncement(String id, String message, String cusiD) {
	// TODO Auto-generated method stub
	return false;
}

@Override
public boolean Deleteannouncement(String id) {
	// TODO Auto-generated method stub
	return false;
}


	 
 
}
