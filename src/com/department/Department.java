package com.department;

public class Department {
	
	String DeptID;
	String DeptName;
	String DeptLocation;
	String DeptHead;
	
	//overloaded constructor
	public Department(String deptID, String deptName, String deptLocation, String deptHead) {
	
		DeptID = deptID;
		DeptName = deptName;
		DeptLocation = deptLocation;
		DeptHead = deptHead;
	}

	public String getDeptID() {
		return DeptID;
	}

	public String getDeptName() {
		return DeptName;
	}

	public String getDeptLocation() {
		return DeptLocation;
	}

	public String getDeptHead() {
		return DeptHead;
	}

	

}
