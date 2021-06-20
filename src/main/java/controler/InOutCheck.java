package controler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.InOutCheckDTO;
import vo.UserVO;

/**
 * Servlet implementation class InOutCheck
 */
@WebServlet("/InOutCheck.do")
public class InOutCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InOutCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		UserVO user = (UserVO)session.getAttribute("user");
		String toggle = request.getParameter("toggle");
		
		InOutCheckDTO io = new InOutCheckDTO();
		
		if(toggle.equals("1"))
		{
			if(io.out_check(user).equals("2"))
			{
				io.output(user);
			}
		}
		else
		{
			io.input(user);
		}
		
		/*
		 * RequestDispatcher rd = request.getRequestDispatcher("/UserMain.do");
		 * rd.forward(request, response);
		 */
		response.sendRedirect("/UserMain.do");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
