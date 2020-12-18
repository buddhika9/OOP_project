package com.Employee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.EmployeeService.EmployeeService;




public class EmployeeDBUtil implements EmployeeService {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	//inserting the values to the employee table
    public  boolean insertcustomer(int emp_id, String fname, String lname, String gender, String address,String contact_num, String nic, String post, String email,String password,String department) {
    	
    	boolean isSuccess = false;
    	
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "insert into employee.employee values ('"+emp_id+"','"+fname+"','"+lname+"','"+gender+"','"+address+"','"+password+"','"+contact_num+"','"+nic+"','"+post+"','"+email+"','"+department+"')";
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
  //updating the values to the employee table
    public boolean updateemp(String emp_id,String fname,String lname,String gender,String address,String contact_num,String nic ,String post,String email, String password,String department) {
    	
    	
    	boolean isSuccess = false;
    	
        	try {
        		//testing databse connecion
        		con = DBConnect.getConnection();
        		stmt = con.createStatement();
        		//Sql querry in updating the recieved details to the database
        		String sql = "update employee.employee set fname='"+fname+"',lname='"+lname+"',gender='"+gender+"',address='"+address+"',password = '"+password+"',contact_num='"+contact_num+"',nic='"+nic+"',post='"+post+"',email='"+email+"',department ='"+department+"'" 
        					+"where emp_id='"+emp_id+"'";
        				
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
    
  //deleting the values to the employee table
    public  boolean deleteemp(String emp_id) {
    	
    	boolean isSuccess = false;
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql querry in deleting the recieved details in the database
    		String sql = "delete from employee.employee where emp_id='"+emp_id+"'";
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

    public  List<Employee> validate(String id, String password) {
    	
    	ArrayList<Employee> emp = new ArrayList<>();
    	
    	//create database connection
    	String url = "jdbc:mysql://localhost:3306/employee";
    	String user = "root";
    	String pass = "";
    	
    	//validate
    	
    	try {
    	    
    	    Class.forName("com.mysql.jdbc.Driver");
    	    
    	    Connection con = DriverManager.getConnection(url, user, pass);
    	    Statement stmt = con.createStatement();
    	    String sql = "select * from employee.employee where emp_id='"+id+"' and password='"+password+"'";	    
    	    ResultSet rs = stmt.executeQuery(sql);
    	    
    	    if(rs.next()) {
    	    String emp_id = rs.getString(1);
    		String fname = rs.getString(2);
    		String lname = rs.getString(3);
    		String gender = rs.getString(4);
    		String Password = rs.getString(5);
    		String address = rs.getString(6);
    		String contact_num = rs.getString(7);
    		String nic = rs.getString(8);
    		String post = rs.getString(9);
    		String email = rs.getString(10);
    		String department = rs.getString(11);
    		
    		
    		Employee c = new Employee(emp_id, fname, lname, gender, address, contact_num, nic, post, email, Password,department);
    		emp.add(c);
    	    }
    	    
    	}
    	catch(Exception e) {
    	    e.printStackTrace();
    	}
    	
    	return emp;
    	
       }
    	
    

    

}
