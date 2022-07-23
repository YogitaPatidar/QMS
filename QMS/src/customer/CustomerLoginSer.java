package customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CustomerLoginSer
 */
@WebServlet("/CustomerLoginSer")
public class CustomerLoginSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/qms","root","");
			Statement stmt=conn.createStatement();
			String query="SELECT * from `customer` where email='"+request.getParameter("txtemail1")+"' and password='"+request.getParameter("txtpass1")+"'";
			ResultSet rs=stmt.executeQuery(query);
			if(rs.next()){
				HttpSession session=request.getSession();
				session.setAttribute("custid",rs.getInt("custid"));
				session.setAttribute("custname",rs.getString("custname"));
				response.sendRedirect("customer/cdashboard.jsp");
			}
			else{
				response.sendRedirect("index.jsp?q=Invalid email or password");
			}
			conn.close();
		}
		catch(Exception e){
			PrintWriter out=response.getWriter();
			out.print(e);
		}
		
		
	}

}
