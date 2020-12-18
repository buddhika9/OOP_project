package com.announcementServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Employee.EmployeeDBUtil;
import com.announcement.announcementDBUtil;
import com.service.Service;

/**
 * Servlet implementation class DeleteAnnouncementServlet
 */
@WebServlet("/DeleteAnnouncementServlet")
public class DeleteAnnouncementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 boolean isTrue = false;
		 //setting the id to a variable recieved from list form
		 String emp_id = request.getParameter("empid");
		 
		
		try {
			
			Service service = new announcementDBUtil();	
			//sending the set values to the delete method in announcementDBUtil
			isTrue  = service.Deleteannouncement(emp_id);
			
			
			if(isTrue == true) {
				//redirecting to the list announcement form
				response.sendRedirect("indexaddAnnouncement.jsp");
			}else {
				
				//redirecting to the list announcement form
				response.sendRedirect("indexaddAnnouncement.jsp");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
			
			
	
	}

		
}


