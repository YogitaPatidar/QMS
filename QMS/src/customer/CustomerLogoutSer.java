package customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CustomerLogoutSer
 */
@WebServlet("/CustomerLogoutSer")
public class CustomerLogoutSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			HttpSession session=request.getSession();
			session.removeAttribute("custid");
			session.removeAttribute("custname");
			 session.invalidate();
			 response.sendRedirect("index.jsp");
		}
		catch(Exception e){
			
		}
		
	}

	
}
