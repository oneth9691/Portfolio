package controler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.StudentInfoDTO;
import vo.UserVO;

/**
 * Servlet implementation class Withdrawal
 */
@WebServlet("/Withdrawal.do")
public class Withdrawal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Withdrawal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		UserVO user = new UserVO();
		user.setEmail(request.getParameter("email"));
		user.setUsername(request.getParameter("username"));
		
		StudentInfoDTO dto = new StudentInfoDTO();
		dto.withdrawal(user);
		
		RequestDispatcher rd = request.getRequestDispatcher("/AdminMain.do");
		rd.forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
