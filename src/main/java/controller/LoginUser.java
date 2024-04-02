package controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.Dao;
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
					HttpSession session=req.getSession();
					
					session.setAttribute("user", u);
//					byte[] b=u.getUserimage();
//					String im=b.toString();
//					req.setAttribute("user",u);
					req.getRequestDispatcher("home.jsp").include(req, resp);				 
				}
				else {
					//password is wrong
					req.setAttribute("message", "password Wrong");
					req.getRequestDispatcher("login.jsp").include(req, resp);
				}
			}
			else {
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
