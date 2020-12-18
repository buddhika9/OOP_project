package com.salary;

public class salary {

	
	int id;
	String month;
	Double payment;
	double commision;
	String status;
	String empid;
	
	//overloaded constructor
	public salary(int id, String month, Double payment, double commision, String status, String empid) {
	
		this.id = id;
		this.month = month;
		this.payment = payment;
		this.commision = commision;
		this.status = status;
		this.empid = empid;
	}

	public int getId() {
		return id;
	}

	public String getMonth() {
		return month;
	}

	public Double getPayment() {
		return payment;
	}

	public double getCommision() {
		return commision;
	}

	public String getStatus() {
		return status;
	}

	public String getEmpid() {
		return empid;
	}

}
