package com.Employee;

public class Employee {

	private String emp_id;
	private String fname;
	private String lname;
	private String  gender;
	private String address;
	private String contact_num;
	private String nic;
	private String post;
	private String email;
	private String password;
	private String department;
	
	//overloaded constructor
	public Employee(String emp_id, String fname, String lname, String gender, String address, String contact_num,
			String nic, String post, String email ,String Password,String department) {
		
		this.password = Password;
		this.emp_id = emp_id;
		this.fname = fname;
		this.lname = lname;
		this.gender = gender;
		this.address = address;
		this.contact_num = contact_num;
		this.nic = nic;
		this.post = post;
		this.email = email;
		this.department = department;
	}
	
	public Employee() {
		// TODO Auto-generated constructor stub
	}

	public String getEmp_id() {
		return emp_id;
	}
	
	public String department() {
		return department;
	}

	public String getFname() {
		return fname;
	}


	public String getLname() {
		return lname;
	}

	public String getGender() {
		return gender;
	}

	
	public String getAddress() {
		return address;
	}

	

	public String getContact_num() {
		return contact_num;
	}


	public String getNic() {
		return nic;
	}

	

	public String getPost() {
		return post;
	}


	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

}
