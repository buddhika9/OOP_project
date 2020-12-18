package com.announcementServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Employee.EmployeeDBUtil;
import com.announcement.announcementDBUtil;
import com.service.Service;

/**
 * Servlet implementation class UpdateannouncementServlet
 */
@WebServlet("/UpdateannouncementServlet")
public class UpdateannouncementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		//setting the recieved values from the announcement forms
	    		String annid = request.getParameter("id");
				String message = request.getParameter("Message");
				String empid = request.getParameter("empid");
				
				
				
				boolean isTrue;
				
				Service service = new announcementDBUtil();							
				//sending the set values to the update method in announcementDBUtil
				isTrue = service.updateannouncement(annid, message, empid);
				
				if(isTrue == true) {
			    try {
			    //redirecting to the list announcement page
		        	 response.sendRedirect("indexaddAnnouncement.jsp");
		      		  
			    }
			    catch (Exception e) {
				e.printStackTrace();
			    }
				}else {
			    
					 //redirecting to the list announcement page
			    RequestDispatcher dis = request.getRequestDispatcher("indexaddAnnouncement.jsp");
			    dis.forward(request, response);    
			    
					}
				
				}
	
	}


