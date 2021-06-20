package controler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MyinfoDTO;
import vo.UserVO;

/**
 * Servlet implementation class Myinfo
 */
@WebServlet("/Myinfo_modify.do")
public class Myinfo_modify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Myinfo_modify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("user");	
		String userid = user.getUserid();
		
		String text_pn = request.getParameter("pn_text");
		String text_email = request.getParameter("email_text");
		String text_pw = request.getParameter("pw_text1");
		String type = request.getParameter("type");
		System.out.println("서브밋:" +type);
		System.out.println("전화번호:" +text_pn);
		System.out.println("이메일:" +text_email);
		System.out.println("패스워드:" +text_pw);
		
		if(type.equals("pn"))
		{
			MyinfoDTO dto = new MyinfoDTO();
			dto.ModifyPn(userid,text_pn);
			
		}else if(type.equals("email"))
		{
			MyinfoDTO dto = new MyinfoDTO();
			dto.ModifyEmail(userid,text_email);
			
		}else if(type.equals("pw"))
		{
			MyinfoDTO dto = new MyinfoDTO();
			dto.ModifyPw(userid,text_pw);
		
		}else
		{
			MyinfoDTO dto = new MyinfoDTO();
			dto.userDelete(userid);
			RequestDispatcher rd = request.getRequestDispatcher("/User/login.jsp");
			rd.forward(request, response);
		}	
		
		MyinfoDTO dto = new MyinfoDTO();
		session.setAttribute("user",dto.update(userid));
		
		RequestDispatcher rd = request.getRequestDispatcher("/User/mypage.jsp");
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
