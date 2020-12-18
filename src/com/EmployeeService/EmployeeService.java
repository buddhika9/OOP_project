package com.EmployeeService;

import java.util.List;

import com.Employee.Employee;

public interface EmployeeService {
	
	public  boolean insertcustomer(int emp_id, String fname, String lname, String gender, String address,String contact_num, String nic, String post, String email,String password,String department);
    
	public boolean updateemp(String emp_id,String fname,String lname,String gender,String address,String contact_num,String nic ,String post,String email, String password,String department);
    
	public  boolean deleteemp(String emp_id);
	
	public  List<Employee> validate(String id, String password);

}
