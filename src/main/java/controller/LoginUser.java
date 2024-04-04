package controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.Dao;
import dto.Task;
import dto.User;

@WebServlet("/loginuser")

public class LoginUser extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email=req.getParameter("email");
		String password=req.getParameter("password");

		Dao dao=new Dao();

		try {
			User u=dao.findByEmail(email);
			if(u!=null)
			{
				//verify password
				if(u.getUserpassword().equals(password))
				{
					//login sucess
					//create session and send the data
					HttpSession session=req.getSession();
					
					session.setAttribute("user", u);
					//get all the task related to the user id 
					List<Task> tasks=dao.getAllTasksByUserId(u.getUserid()) ;
					req.setAttribute("tasks", tasks);
//					
					req.getRequestDispatcher("home.jsp").include(req, resp);				 
				}
				else {
					//password is wrong
					req.setAttribute("message", "password Wrong");
					req.getRequestDispatcher("login.jsp").include(req, resp);
				}
			}
			else {
				//email is wrong.
				req.setAttribute("message", "Wrong email");
				req.getRequestDispatcher("login.jsp").include(req, resp);

			}
		}
		catch (ClassNotFoundException | SQLException e)
		{
			e.printStackTrace();
		}


	}

}
