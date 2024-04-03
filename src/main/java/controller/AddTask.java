package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			resp.getWriter().print("task has been created");
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
