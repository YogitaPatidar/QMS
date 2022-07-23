package manager;

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
 * Servlet implementation class ManagerLoginSer
 */
@WebServlet("/ManagerLoginSer")
public class ManagerLoginSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/qms","root","");
			Statement stmt=conn.createStatement();
			String query="SELECT * from `manager` inner join department on manager.dept=department.deptid where email='"+request.getParameter("txtemail1")+"' and password='"+request.getParameter("txtpass1")+"'";
			ResultSet rs=stmt.executeQuery(query);
			if(rs.next()){
				HttpSession session=request.getSession();
				session.setAttribute("mid",rs.getInt("mid"));
				session.setAttribute("mname",rs.getString("mname"));
				session.setAttribute("dept",rs.getInt("dept"));
				session.setAttribute("deptname",rs.getString("deptname"));
				response.sendRedirect("manager/mdashboard.jsp");
			}
			else{
				response.sendRedirect("manager/ManagerLogin.jsp?q=Invalid email or password");
			}
		}
		catch(Exception e){
			
		}
		
}
}
