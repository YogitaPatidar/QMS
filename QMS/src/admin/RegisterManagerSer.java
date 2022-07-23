package admin;
import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterManagerSer
 */
@WebServlet("/RegisterManagerSer")
public class RegisterManagerSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
  	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/qms","root","");
			Statement stmt=conn.createStatement();
			String query="insert into manager(mid,mname,email,password,dept)value(NULL,'"+request.getParameter("txtname")+"','"+request.getParameter("txtemail")+"','"+request.getParameter("txtpass")+"','"+request.getParameter("dept")+"')";
			int x=stmt.executeUpdate(query);
			response.sendRedirect("admin/registerManager.jsp");
			
		}
		catch(Exception e){
			
		}
	}

}
