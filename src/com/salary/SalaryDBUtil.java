package com.salary;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.Employee.DBConnect;

public class SalaryDBUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	//inserting the values to the salary table
    public static boolean insertsalary( String months, double pavement, double comission,String empID) {
    	
    	boolean isSuccess = false;
    	
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "insert into employee.salary values (0,'"+months+"','"+pavement+"','"+comission+"','"+empID+"')";
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
    
    
  //updating the values to the salary table
 public static boolean updateSalary( String month, double pavement, double comission,String empID) {
    	
    	
    	boolean isSuccess = false;
    	
        	try {
        		//testing databse connecion
        		con = DBConnect.getConnection();
        		stmt = con.createStatement();
        		//Sql querry in updating the recieved details to the database
        		String sql = "update employee.salary set months='"+month+"',pavement='"+pavement+"',comission='"+comission+"',empid = '"+empID+"'"
        				+ "where empid='"+empID+"'";
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
 
//deleting the values from the salary table
 
 public boolean deleteSalary(int emp_id) {
 	
 	boolean isSuccess = false;
 	try {
 		//testing databse connecion
 		con = DBConnect.getConnection();
 		stmt = con.createStatement();
 		//Sql querry in deleting the recieved details in the database
 		String sql = "delete from employee.salary where empid='"+emp_id+"'";
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
