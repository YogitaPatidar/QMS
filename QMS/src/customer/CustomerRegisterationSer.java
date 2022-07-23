package customer;
import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
/**
 * Servlet implementation class CustomerRegisterationSer
 */
@WebServlet("/CustomerRegisterationSer")
public class CustomerRegisterationSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/qms","root","");
			Statement stmt=conn.createStatement();
			String query="INSERT INTO `customer` (`custname`, `email`, `password`) VALUES ('"+request.getParameter("txtname")+"','"+request.getParameter("txtemail")+"','"+request.getParameter("txtpass")+"')";
			int x=stmt.executeUpdate(query);
			if(x!=0){
				response.sendRedirect("index.jsp?q=Registration Succesful...");
			}
			else{
				response.sendRedirect("index.jsp?q=Registration failed/Already have an account...");
			}
			
		}
		catch(Exception e){
			PrintWriter out=response.getWriter();
			out.print(e);
			
		}
	}

}
