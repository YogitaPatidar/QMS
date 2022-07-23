package admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLogoutSer
 */
@WebServlet("/AdminLogoutSer")
public class AdminLogoutSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
   protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
	   try{
		   HttpSession session=request.getSession();
		   session.removeAttribute("adminid");
		   session.removeAttribute("adminname");
		   session.invalidate();
		   response.sendRedirect("admin/login.jsp");
	   }
	   catch(Exception e){
		   
	   }
	   
   }
}
