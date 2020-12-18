package com.LeaveServlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Leave.LeaveDBUtil;
import com.announcement.announcementDBUtil;
import com.service.Service;

/**
 * Servlet implementation class AddLeaveServlet
 */
@WebServlet("/AddLeaveServlet")
public class AddLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Setting the values to variable sent from the leave form
		String id = request.getParameter("id");
		String reason = request.getParameter("Reason");
		String FromDate = (request.getParameter("FromDate")) ;
		String ToDate = (request.getParameter("ToDate"));
		String Status = request.getParameter("status");
		
		boolean isTrue;
		
		Service service = new LeaveDBUtil();
		//sending the set values to the leaveDB
		isTrue = service.insertLeave(id, reason, FromDate, ToDate, Status);
		
		if(isTrue == true) {
			//redirecting to the List leave form
			RequestDispatcher dis = request.getRequestDispatcher("indexempaddleave.jsp");
			dis.forward(request, response);
			
		} else {
			//redirecting to the List leave form
			RequestDispatcher dis2 = request.getRequestDispatcher("indexempaddleave.jsp");
			dis2.forward(request, response);
		}
		
		
	}
	
	
}
