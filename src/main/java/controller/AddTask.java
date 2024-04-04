package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import dto.Task;
import dto.User;

@WebServlet("/addtask")
public class AddTask extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int taskid=Integer.parseInt(req.getParameter("id"));
	String tasktitle=req.getParameter("title");
	String tasktdescription=req.getParameter("description");
	String taskpriority=req.getParameter("priority");
	String tasktduedate=req.getParameter("duedate");
	
	User user=(User)req.getSession().getAttribute("user");
	int userid=user.getUserid();
	
	Task task=new Task(taskid, tasktitle, tasktdescription, taskpriority, tasktduedate, "pending", userid);
	
	Dao dao= new Dao();
	try {
		int res=dao.createTask(task);
		if(res>0) {
			HttpSession session=req.getSession();
			User u=(User)session.getAttribute("user");
			
			req.setAttribute("tasks", dao.getAllTasksByUserId(u.getUserid()));
			
			RequestDispatcher rd=req.getRequestDispatcher("home.jsp");
			rd.include(req, resp);
		}
		else {
			resp.getWriter().println("failed");
		}
	}
	catch(ClassNotFoundException | SQLException e) {
		e.printStackTrace();
		
	} 

}
}
