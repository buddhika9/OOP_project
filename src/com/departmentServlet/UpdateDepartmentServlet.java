package com.departmentServlet;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.department.DepartmentDBUtil;

/**
 * Servlet implementation class UpdateDepartmentServlet
 */
@WebServlet("/UpdateDepartmentServlet")
public class UpdateDepartmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//setting the recieved values from the update department forms to variables
		String DeptId = request.getParameter("DeptId");
		String DeptName = request.getParameter("DeptName");
		String DeptLocation = request.getParameter("DeptLocation");
		String DeptHead = request.getParameter("DeptHead");
		
		boolean isTrue;
		//creating a object from the DepartmentDBUtil
		DepartmentDBUtil DepartmentDBUtil = new DepartmentDBUtil();
		//sending the set values to the update method in DepartmentDBUtil 
		isTrue = DepartmentDBUtil.updatedepartment(DeptId, DeptName, DeptLocation, DeptHead);
		
		if(isTrue == true) {
	    try {
	    	//redirecting to the list department form
        	 response.sendRedirect("indexaddDepartment.jsp");
      		  
	    }
	    catch (Exception e) {
		e.printStackTrace();
	    	}
	    
		}else {
			//redirecting to the list department form
	    RequestDispatcher dis = request.getRequestDispatcher("indexaddDepartment.jsp");
	    dis.forward(request, response);    
	    
		}
		
	}
}


