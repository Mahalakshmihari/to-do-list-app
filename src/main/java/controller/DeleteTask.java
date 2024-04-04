package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;

import dto.User;
@WebServlet("/deletetask")
public class DeleteTask extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int taskid=Integer.parseInt(req.getParameter("taskid"));
		Dao dao=new  Dao();
	
		try {
			dao.deleteTaskByTaskId(taskid);
			
			HttpSession session=req.getSession();
			User u=(User)session.getAttribute("user");
			
			
			req.setAttribute("tasks", dao.getAllTasksByUserId(u.getUserid()));
			req.getRequestDispatcher("home.jsp").include(req, resp);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
