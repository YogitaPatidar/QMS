package manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MReplySer
 */
@WebServlet("/MReplySer")
public class MReplySer extends HttpServlet {
	private static final long serialVersionUID = 1;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();

		try{
			HttpSession session=request.getSession();
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/qms","root","");
			Statement stmt=conn.createStatement();
			String query="INSERT INTO `reply` (`replyid`, `feedid`, `reply`, `replyby`, `datetime`) VALUES (NULL,'"+request.getParameter("feedid")+"','"+request.getParameter("txtreply")+"','Manager',current_timestamp())";
			int x=stmt.executeUpdate(query);
			if(x!=0){
			response.sendRedirect("manager/Reply.jsp?q="+request.getParameter("feedid"));
			}
			else{
				response.sendRedirect("manager/Reply.jsp?q=Message not sent...");
			}			 
		}
		catch(Exception e){
			out.print(e);
		}
	}

}
