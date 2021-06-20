package controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.JoinDTO;
import vo.UserVO;

/**
 * Servlet implementation class join
 */
@WebServlet("/join.do")
public class join extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public join() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		String idtxt = request.getParameter("idtxt"); String pw = request.getParameter("pw"); String email = request.getParameter("email");
		String nametxt = request.getParameter("nametxt"); String birth = request.getParameter("birth"); String pn = request.getParameter("pn");
		
		UserVO user = new UserVO();
		user.setUserid(idtxt);
		user.setUserpw(pw);
		user.setUsername(nametxt);
		user.setEmail(email);
		user.setPn(pn);
		user.setBirth(birth);
		
		
		JoinDTO join = new JoinDTO();
		join.insert_join(user);
		response.sendRedirect("/User/login.jsp");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
