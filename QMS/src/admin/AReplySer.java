package admin;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class AReplySer
 */
@WebServlet("/AReplySer")
public class AReplySer extends HttpServlet {
	private static final long serialVersionUID = 1;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();

		try{
			HttpSession session=request.getSession();
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/qms","root","");
			Statement stmt=conn.createStatement();
			String query="INSERT INTO `reply` (`replyid`, `feedid`, `reply`, `replyby`, `datetime`) VALUES (NULL,'"+request.getParameter("feedid")+"','"+request.getParameter("txtreply")+"','Admin',current_timestamp())";
			int x=stmt.executeUpdate(query);
			if(x!=0){
			response.sendRedirect("admin/Reply.jsp?q="+request.getParameter("feedid"));
			}
			else{
				response.sendRedirect("admin/Reply.jsp?q=Message not sent...");
			}			 
		}
		catch(Exception e){
			out.print(e);
		}
	}

}
