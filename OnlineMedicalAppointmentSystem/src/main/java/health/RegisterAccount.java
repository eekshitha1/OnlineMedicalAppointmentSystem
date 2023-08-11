package health;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterAccount")
public class RegisterAccount extends HttpServlet {

public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

	String uname = request.getParameter("uname").trim();
	String pass = request.getParameter("pass").trim();
	String gender = request.getParameter("gender").trim();
	String contact = request.getParameter("phone").trim();
	String email = request.getParameter("email").trim();
	String address = request.getParameter("address").trim();
	
	
	try{
		String msg = Database.registerAccount(uname,pass,gender,contact,email,address);
		RequestDispatcher dispatch = request.getRequestDispatcher("RegisterAccount.jsp?t1="+msg);
		dispatch.forward(request, response);
	}catch(Exception e){
		e.printStackTrace();
	}
}
}
