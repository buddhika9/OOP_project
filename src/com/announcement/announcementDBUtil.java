package com.announcement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import com.Employee.DBConnect;
import com.Leave.Leave;
import com.service.Service;

public class announcementDBUtil implements Service {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	

	//Inserting the details recieved from the announcemnt form
 public  boolean insertannouncement(String id, String message, String cusiD) {
	    	
	    	boolean isSuccess = false;
	    	
	    	try {
	    		//Creating a database connection
	    		con = DBConnect.getConnection();
	    		stmt = con.createStatement();
	    		//Inserting the announcement details to the database
	    	    String sql = "insert into employee.announcement values (0,'"+message+"','"+cusiD+"')";
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
 
 
//Updating the details recieved from the announcemnt form
 public boolean updateannouncement(String id, String message, String cusiD) {
 	
 	
 	boolean isSuccess = false;
 	
     	try {
     		con = DBConnect.getConnection();
     		stmt = con.createStatement();
     		//updating the databse with updated details
     		String sql = "update employee.announcement set Message='"+message+"',empid='"+cusiD+"'"
     				+ "where empid='"+cusiD+"'";
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
 
//Updating the details recieved form
 public boolean Deleteannouncement(String id) {
	 	
	 	
	 	boolean isSuccess = false;
	 	
	     	try {
	     		con = DBConnect.getConnection();
	     		stmt = con.createStatement();
	     		//deleting the announcement details from the database relevant to the employee
	     		String sql = "delete from  employee.announcement where empid='"+id+"'";
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


@Override
public boolean insertLeave(String ID, String reason, String FromDate, String ToDate, String status) {
	// TODO Auto-generated method stub
	return false;
}


@Override
public boolean updateLEave(String ID, String reason, String FromDate, String ToDate, String status) {
	// TODO Auto-generated method stub
	return false;
}


@Override
public boolean DeleteLeave(String id) {
	// TODO Auto-generated method stub
	return false;
}


@Override
public List<Leave> validate(String id) {
	// TODO Auto-generated method stub
	return null;
}
	 
 
 
 
 

}
