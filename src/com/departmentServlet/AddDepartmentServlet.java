package com.departmentServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.announcement.announcementDBUtil;
import com.department.DepartmentDBUtil;

/**
 * Servlet implementation class AddDepartmentServlet
 */
@WebServlet("/AddDepartmentServlet")
public class AddDepartmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//setting the recieved values from the adepartment forms to variables
		String DeptId = request.getParameter("DeptId");
		String DeptName = request.getParameter("DeptName");
		String DeptLocation = request.getParameter("DeptLocation");
		String DeptHead = request.getParameter("DeptHead");
		
		
		
	boolean isTrue;
	//sending the set values to the insert method in DepartmentDBUtil 
		isTrue = DepartmentDBUtil.insertDepartment(DeptId, DeptName, DeptLocation, DeptHead);
		
		if(isTrue == true) {
			//redirecting to the list department form
			RequestDispatcher dis = request.getRequestDispatcher("indexaddDepartment.jsp");
			dis.forward(request, response);
			
		} else {
			//redirecting to the list department form
			RequestDispatcher dis2 = request.getRequestDispatcher("indexaddDepartment.jsp");
			dis2.forward(request, response);
		}
		
		
	}
				
}


