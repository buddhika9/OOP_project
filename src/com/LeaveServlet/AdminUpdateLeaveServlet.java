package com.LeaveServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Leave.LeaveDBUtil;
import com.service.Service;

/**
 * Servlet implementation class AdminUpdateLeaveServlet
 */
@WebServlet("/AdminUpdateLeaveServlet")
public class AdminUpdateLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Setting the values to variable sent from the leave form
		String id = request.getParameter("id");
		String reason = request.getParameter("Reason");
		String FromDate = (request.getParameter("FromDate")) ;
		String ToDate = (request.getParameter("ToDate"));
		String Status = request.getParameter("status");
		
		
		Service service = new LeaveDBUtil();
		
		boolean isTrue;
		
		
		//sending the set values to the leaveDB
		isTrue = service.updateLEave(id, reason, FromDate, ToDate, Status);
		
		if(isTrue == true) {
			
			
	    try {
	    	//redirecting to the List leave form
        	 response.sendRedirect("indexadminleave.jsp");
      		  
	    }
	    catch (Exception e) {
		e.printStackTrace();
	    }
		}else {
	    
			//redirecting to the List leave form
	    RequestDispatcher dis = request.getRequestDispatcher("indexadminleave.jsp");
	    dis.forward(request, response);    
	    
		}
		
		}
	}


