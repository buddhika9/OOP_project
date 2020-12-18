package com.announcementServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.announcement.announcementDBUtil;
import com.service.Service;
/**
 * Servlet implementation class AddAnnouncementServlet
 */
@WebServlet("/AddAnnouncementServlet")
public class AddAnnouncementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//setting the recieved values from the announcement forms to variables
		String id = request.getParameter("id");
		String message = request.getParameter("message");
		String cusid = request.getParameter("cusid");
		
	boolean isTrue;
		//sending the set values to the insert method in announcementDB 
	
		Service service = new announcementDBUtil();			
		isTrue = service.insertannouncement(id,message,cusid );
		
		if(isTrue == true) {
			//redirecting to the list announcement form
			RequestDispatcher dis = request.getRequestDispatcher("indexaddAnnouncement.jsp");
			dis.forward(request, response);
			
		} else {
			//redirecting to the list announcement form
			RequestDispatcher dis2 = request.getRequestDispatcher("indexaddAnnouncement.jsp");
			dis2.forward(request, response);
		}
		
		
	}
		
}

