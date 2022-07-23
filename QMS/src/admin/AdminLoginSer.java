package admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLoginSer
 */
@WebServlet("/AdminLoginSer")
public class AdminLoginSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/qms","root","");
			Statement stmt=conn.createStatement();
			String query="SELECT * from `admin` where email='"+request.getParameter("txtemail1")+"' and password='"+request.getParameter("txtpass1")+"'";
			ResultSet rs=stmt.executeQuery(query);
			if(rs.next()){
				HttpSession session=request.getSession();
				session.setAttribute("adminname",rs.getString("adminname"));
				session.setAttribute("adminid",rs.getInt("adminid"));
				response.sendRedirect("admin/adashboard.jsp");
			}
			else{
				response.sendRedirect("admin/login.jsp?q=Invalid email or password");
			}
		}
		catch(Exception e){
			
		}
		
}
}
