package controler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.LoginDTO;
import vo.UserVO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");
		LoginDTO dto = new LoginDTO();
		
		try {
		if(request.getParameter("login_id").equals("admin") && request.getParameter("login_pw").equals("123456789"))
		{
			session.setAttribute("admin_id", request.getParameter("login_id"));
			session.setAttribute("islogin", "true");
			/*
			 * RequestDispatcher rd = request.getRequestDispatcher("/AdminMain.do");
			 * rd.forward(request, response);
			 */
			response.sendRedirect("/AdminMain.do");
		}
			
		else if(dto.login(request.getParameter("login_id"), request.getParameter("login_pw")) == null)
		{
			RequestDispatcher rd = request.getRequestDispatcher("/User/loginerror.jsp");
			rd.forward(request, response);
		}
		
		else if(dto.login(request.getParameter("login_id"), request.getParameter("login_pw")) != null)
		{
			session.setAttribute("user", dto.login(request.getParameter("login_id"), request.getParameter("login_pw")));
			session.setAttribute("islogin", "true");
			/*
			 * RequestDispatcher rd = request.getRequestDispatcher("/UserMain.do");
			 * rd.forward(request, response);
			 */
			
			response.sendRedirect("/UserMain.do");
		}
		
		}
		catch(Exception e)
		{
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
