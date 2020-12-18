package com.department;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.Employee.DBConnect;

public class DepartmentDBUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
//inserting the values to the department table
public static boolean insertDepartment(String deptID, String deptName, String deptLocation, String deptHead) {
	    	
	    	boolean isSuccess = false;
	    	
	    	try {
	    		//testing database connection
	    		con = DBConnect.getConnection();
	    		stmt = con.createStatement();
	    		//Sql querry in inserting the recieved details to the database
	    	    String sql = "insert into employee.department values (0,'"+deptID+"','"+deptName+"','"+deptLocation+"','"+deptHead+"')";
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
//updating the values to the department table
public boolean updatedepartment(String deptID, String deptName, String deptLocation, String deptHead) {
	
	
	boolean isSuccess = false;
	
    	try {
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql query in inserting the updated details to the employee form
    		String sql = "update employee.department set deptID='"+deptID+"',deptName='"+deptName+"',deptLocation='"+deptLocation+"',deptHead='"+deptHead+"'"
    				+ "where deptID='"+deptID+"'";
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

//deleting the values to the department table
public boolean DeleteDepartment(String deptID) {
 	
 	
 	boolean isSuccess = false;
 	
     	try {
     		//testing databse connection
     		con = DBConnect.getConnection();
     		stmt = con.createStatement();
     		//Sql query in deleting the details to the employee form relevant to the employee
     		String sql = "delete from  employee.department where deptID='"+deptID+"'";
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
 

 
 

}
