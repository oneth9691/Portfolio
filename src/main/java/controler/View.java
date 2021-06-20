package controler;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.NoticeDTO;
import vo.NoticeVO;

/**
 * Servlet implementation class View
 */
@WebServlet("/View.do")
public class View extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public View() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");	
		String no = request.getParameter("no");
		String ViewCookie = null;
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null && cookies.length > 0)
		{
			System.out.println("현재쿠키수:"+cookies.length);
			for( int i = 0 ; i < cookies.length; i ++)
			{
				if(cookies[i].getName().equals("cookie"+ no))
				{
					System.out.println("쿠키존재,조회수증가X");
					ViewCookie = cookies[i].getName();	
					break;
				}
			}	
		}
		if(ViewCookie==null)
		{
			System.out.println("쿠키생성: 게시글" + no +"번");
			Cookie cookie = new Cookie("cookie"+no,URLEncoder.encode(no,"utf-8"));
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
			NoticeDTO dto = new NoticeDTO();
			dto.HitUp(no);
		}	
		
		NoticeDTO dto = new NoticeDTO();
		request.setAttribute("no",dto.View(no).getNo());
		request.setAttribute("title",dto.View(no).getTitle());
		request.setAttribute("body",dto.View(no).getBody());
		request.setAttribute("wdate",dto.View(no).getWdate());
		request.setAttribute("hit",dto.View(no).getHit());
		request.setAttribute("file",dto.View(no).getFile());

		RequestDispatcher rd = request.getRequestDispatcher("/board/view.jsp");
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
