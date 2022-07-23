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
 * Servlet implementation class FeedbackSer
 */
@WebServlet("/FeedbackSer")
public class FeedbackSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();

		try{
			HttpSession session=request.getSession();
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/qms","root","");
			Statement stmt=conn.createStatement();
			String query="INSERT INTO feedback(`feedid`, `feedback`, `custid`, `deptid`) VALUES (NULL, '"+request.getParameter("txtfeedback")+"','"+session.getAttribute("custid")+"','"+request.getParameter("dept")+"')";
			int x=stmt.executeUpdate(query);
			if(x!=0){
			response.sendRedirect("customer/feedback.jsp?q=Thanks for feedback");
			}
			else{
				response.sendRedirect("customer/feedback.jsp?q=Error");
			}
			 
		}
		catch(Exception e){
			out.print(e);
		}
	}

}
