package com.service;

import java.util.List;
import java.util.logging.Logger;

import com.Leave.Leave;

public interface Service {
	
	public static final Logger log = Logger.getLogger(Service.class.getName());

	public  boolean insertannouncement(String id, String message, String cusiD);

	public boolean updateannouncement(String id, String message, String cusiD);
	
    public boolean Deleteannouncement(String id);
    
    
    
    public  boolean insertLeave(String ID, String reason, String FromDate, String ToDate , String status);
    
    public boolean updateLEave(String ID, String reason, String FromDate, String ToDate , String status);
    
    public boolean DeleteLeave(String id);
    
    public  List<Leave> validate(String id);
	
	
}
