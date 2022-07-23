package manager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ManagerLogoutSer
 */
@WebServlet("/ManagerLogoutSer")
public class ManagerLogoutSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException ,IOException{
    	try{
    		HttpSession session=request.getSession();
    		session.removeAttribute("mid");
    		session.removeAttribute("mname");
    		session.invalidate();
    		response.sendRedirect("ManagerLogin.jsp");
    	}
    	catch(Exception e){
    		
    	}
    }

}
