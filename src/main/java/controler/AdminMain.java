package controler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.AdminMainDTO;
import dto.PagingDTO;
import dto.StudentInfoDTO;
import dto.SubjectDTO;
import vo.UserVO;

/**
 * Servlet implementation class AdminMain
 */
@WebServlet("/AdminMain.do")
public class AdminMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMain() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{		
		int start = 0; int percount = 20;	int curpage = 1;
		if(curpage == 0)
		{
			curpage = 1;
		}
		
		String p_start = request.getParameter("start");
		String p_percout = request.getParameter("percount");
		String p_curpage = request.getParameter("curpage");
		
		
		if(p_start != null) {start = Integer.parseInt(p_start);}
		if(p_percout != null) {percount = Integer.parseInt(p_percout);}
		if(p_curpage != null) {curpage = Integer.parseInt(p_curpage);}
		
		start = (curpage - 1) * percount;
		
		String sub = request.getParameter("op");
		if(sub == "" ) {sub = null;}
		else if(sub != null && sub.equals(" 과목을 선택해주세요.")){sub = null;}
		String date = request.getParameter("list_date");
		if(date == "") {date = null;}
		String name = request.getParameter("list_name");
		if(name == "") {name = null;}
		
		System.out.println("sub:" + sub);
		System.out.println("date:" + date);
		System.out.println("name:" + name);
		
		System.out.println(sub+date+name);
		
		String type = request.getParameter("type");
		if(type == null) {type = "admin";}
		
		AdminMainDTO admin = new AdminMainDTO();
		request.setAttribute("admin", admin);
		
	
		
		admin.setStart(start);
		admin.setPercount(percount);
		
		request.setAttribute("in_search", admin.admin_student_list(name, date, sub));
		
		SubjectDTO subject = new SubjectDTO();
		request.setAttribute("subject", subject);
		
		UserVO user = new UserVO();
		user.setUserid(request.getParameter("userid"));
		user.setSubject(request.getParameter("subject"));
		StudentInfoDTO info = new StudentInfoDTO();
		request.setAttribute("info", info.student_data(user));
		RequestDispatcher rd;
		if(type.equals("viewstudent"))
		{
			rd = request.getRequestDispatcher("/admin/student.jsp");
		}
		else
		{
			rd = request.getRequestDispatcher("/admin/admin.jsp");
		}
		 
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
