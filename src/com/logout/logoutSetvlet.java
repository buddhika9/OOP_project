package com.logout;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class logoutSetvlet
 */
@WebServlet("/logoutSetvlet")
public class logoutSetvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
				//Get Session
				HttpSession session = request.getSession();
				
				//Remove Attributes from Session
				session.removeAttribute("id");
				session.removeAttribute("password");
						    
				//redirecting to the login
		    	response.sendRedirect("login.jsp?Logout=Successful");
	}

}
