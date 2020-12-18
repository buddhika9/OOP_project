package com.LeaveServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javax.servlet.http.HttpSession;

import com.Leave.LeaveDBUtil;
import com.service.Service;

/**
 * Servlet implementation class DeleteLeaveServlet
 */
@WebServlet("/DeleteLeaveServlet")
public class DeleteLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Setting the id to variable sent from the leave form
		String id = request.getParameter("id");
		
		boolean isTrue;
		
		Service service = new LeaveDBUtil();
		//sending the set values to the leaveDB
		isTrue = service.DeleteLeave(id);
		
		if(isTrue == true) {
	    try {
	    	
	        	 response.sendRedirect("indexempaddleave.jsp");
	      }
	    catch (Exception e) {
		e.printStackTrace();
	    }
		}else {
	    
			//redirecting to the List leave form
	    RequestDispatcher dis = request.getRequestDispatcher("indexempaddleave.jsp");
	    dis.forward(request, response);    
	    
		}
		
		}
		
	
	}


