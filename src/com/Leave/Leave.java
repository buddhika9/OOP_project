package com.Leave;

import java.sql.Date;

public class Leave {
	
	String leaveID;
	String leaveReason;
	String FromDate;
	String ToDate;
	String LeaveStatus;
	
	//overloaded constructor
	public Leave(String leaveID, String leaveReason, String fromDate2, String toDate2, String leaveStatus) {

		this.leaveID = leaveID;
		this.leaveReason = leaveReason;
		FromDate = fromDate2;
		ToDate = toDate2;
		LeaveStatus = leaveStatus;
	}
	
	
	public String getLeaveID() {
		return leaveID;
	}
	public String getLeaveReason() {
		return leaveReason;
	}
	public String getFromDate() {
		return FromDate;
	}
	public String getToDate() {
		return ToDate;
	}
	public String getLeaveStatus() {
		return LeaveStatus;
	}

	
	



}
