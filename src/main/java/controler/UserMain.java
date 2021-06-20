package controler;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.CalendarDTO;
import dto.InOutCheckDTO;
import dto.StudentInfoDTO;
import dto.UserDistinctionDTO;
import dto.UserMainDTO;
import vo.UserVO;

/**
 * Servlet implementation class UserMain
 */
@WebServlet("/UserMain.do")
public class UserMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMain() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		  
		
		HttpSession session = request.getSession(true);
		UserVO user = (UserVO)session.getAttribute("user");
		
		StudentInfoDTO dto = new StudentInfoDTO();
		session.setAttribute("student", dto.student_data(user));
		
		UserMainDTO main = new UserMainDTO();
		request.setAttribute("main", main.student_student_list(user));
		
		UserDistinctionDTO ud = new UserDistinctionDTO();
		request.setAttribute("ud", ud.userdistinction(user));
		
		
		InOutCheckDTO io = new InOutCheckDTO();
		if(io.in_check(user).equals("0"))
		{
			request.setAttribute("toggle", "0");
		}
		else if(io.in_check(user).equals("1"))
		{
			request.setAttribute("toggle", "1");
		}
		if(io.out_check(user).equals("3"))
		{
			request.setAttribute("toggle3", "3");
		}
		
		RequestDispatcher rd = null;
		rd = request.getRequestDispatcher("/User/user.jsp");
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
