package health;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginPatient")
public class LoginPatient extends HttpServlet {

public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

	String uname = request.getParameter("t1").trim();
	String pwd = request.getParameter("t2").trim();
	
	try{
		String result = Database.patientLogin(uname,pwd);
		if(result.equals("success")) {
			HttpSession http_session = request.getSession();
			http_session.setAttribute("uname",uname);
			RequestDispatcher dispatch = request.getRequestDispatcher("PatientHomePage.jsp?t1=Welcome "+uname);
			dispatch.forward(request, response);
		}else{
			RequestDispatcher dispatch = request.getRequestDispatcher("PatientLoginPage.jsp?t1=invalid username or password");
			dispatch.forward(request, response);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	}

}
