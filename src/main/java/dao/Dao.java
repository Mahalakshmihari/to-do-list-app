package dao;

import java.sql.Blob;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;

import dto.Task;
import dto.User;

public class Dao {
	
	static public Connection getConnection() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/todolist","root","root");
		return con;
	}
	
	
	 static public int saveUser(User user) throws ClassNotFoundException, SQLException {
		Connection con=getConnection();
		PreparedStatement pst=con.prepareStatement("insert into user values(?,?,?,?,?,?)");
		pst.setInt(1,user.getUserid());
		pst.setString(2,user.getUsername());
		pst.setString(3,user.getUseremail());
		pst.setLong(4, user.getUsercontact());
		pst.setString(5,user.getUserpassword());
		pst.setBlob(6, new SerialBlob(user.getUserimage()));
		int res=pst.executeUpdate();
		return res;
		
		
		}
	 
	 
	 public static User findByEmail(String email) throws ClassNotFoundException, SQLException {
		 Connection con=getConnection();
		 PreparedStatement pst=con.prepareStatement("select * from user where useremail=?");
		 pst.setString(1, email);
		 ResultSet rs=pst.executeQuery();
		 
		 if(rs.next())
		 {
			 User u=new User();
			 u.setUserid(rs.getInt(1));
			 u.setUsername(rs.getString(2));
			 u.setUseremail(rs.getString(3));
			 u.setUsercontact(rs.getLong(4));
			 u.setUserpassword(rs.getString(5));
			 //convert blog image to byte[]
			 Blob imageblob= rs.getBlob(6);
			 byte[] image=imageblob.getBytes(1, (int)imageblob.length());
			 
			 u.setUserimage(image);		
			 return u;			 
		 }
		 else {
			 return null;
		 } 
	 }
	 
	 //inserting task into the task
	 public int createTask(Task task) throws ClassNotFoundException, SQLException {
		 Connection con=getConnection();
		 PreparedStatement pst=con.prepareStatement("insert into task values(?,?,?,?,?,?,?)");
		 pst.setInt(1,task.getTaskid() );
		 pst.setString(2,task.getTasktitle());
		 pst.setString(3,task.getTaskdescription());
		 pst.setString(4,task.getTaskpriority());
		 pst.setString(5,task.getTaskduedate() );
		 pst.setString(6, task.getTaskstatus());
		 pst.setInt(7,task.getUserid());
		 
		 int res=pst.executeUpdate();
		return res;
		 
	 }
	 
	 //Displaying the task
	 public List<Task> getAllTasksByUserId(int userId) throws ClassNotFoundException, SQLException{
		 Connection con=getConnection();
		 PreparedStatement pst=con.prepareStatement("select * from task where userid=?");
		 pst.setInt(1, userId);
		 
		 ResultSet rs=pst.executeQuery();
		 List<Task> tasks= new ArrayList<Task>();
		 while(rs.next()) {
		
			 Task task=new Task(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4) , rs.getString(5), rs.getString(6));
			 tasks.add(task);
		 }
		 
		 return tasks;
	 }
	 //Deleting the task
	 public int deleteTaskByTaskId(int taskId) throws ClassNotFoundException, SQLException
	 {
		 Connection con=getConnection();
		 PreparedStatement pst=con.prepareStatement("delete from task where taskid=? ");
		 pst.setInt(1, taskId);
		 
		 int res= pst.executeUpdate();
		 return res;
	 }
}
