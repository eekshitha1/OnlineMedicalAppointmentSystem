package health;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginAdmin")
public class LoginAdmin extends HttpServlet {

public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	Database dataBase = new Database();
	String uname = request.getParameter("t1").trim();
	String pwd = request.getParameter("t2").trim();
	try{
		String result = Database.adminLogin(uname,pwd);
		if(result.equals("success")) {
			HttpSession http_session = request.getSession();
			http_session.setAttribute("uname",uname);
			RequestDispatcher dispatch = request.getRequestDispatcher("AdminHomePage.jsp?t1=Welcome "+uname);
			dispatch.forward(request, response);
		}else{
			RequestDispatcher dispatch = request.getRequestDispatcher("AdminLoginPage.jsp?t1=invalid username and password");
			dispatch.forward(request, response);
		}
	}catch(Exception exc){
		exc.printStackTrace();
	}
}
}
