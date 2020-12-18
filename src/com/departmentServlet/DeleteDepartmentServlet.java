package com.departmentServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.department.DepartmentDBUtil;

/**
 * Servlet implementation class DeleteDepartmentServlet
 */
@WebServlet("/DeleteDepartmentServlet")
public class DeleteDepartmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 boolean isTrue = false;
		//setting the recieved values from the adepartment forms to variables
		 String DeptId = request.getParameter("DeptID");
		 
		
		try {
			//creating a object from the DepartmentDBUtil
			 DepartmentDBUtil DepartmentDBUtil = new DepartmentDBUtil();
			//sending the set values to the delete method in DepartmentDBUtil 
			 isTrue =  DepartmentDBUtil.DeleteDepartment(DeptId);
			
			if(isTrue == true) {
				//redirecting to the list department form
				response.sendRedirect("indexaddDepartment.jsp");
			}else {
				//redirecting to the list department form
				response.sendRedirect("indexaddDepartment.jsp");
			
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	
	}
		
}
	

