package controler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.NoticeDTO;
import vo.NoticeVO;

/**
 * Servlet implementation class Modify
 */
@WebServlet("/Modify.do")
public class Modify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		NoticeDTO dto = new NoticeDTO();
		NoticeVO Mitem = new NoticeVO();
		System.out.println("게시글수정실행");
		Mitem.setNo(request.getParameter("no"));
		Mitem.setTitle(request.getParameter("title"));
		Mitem.setBody(request.getParameter("body"));
		Mitem.setFile(request.getParameter("file"));
		dto.Modify(Mitem);	
		
		dto.View(Mitem.getNo());
		request.setAttribute("no",dto.View(Mitem.getNo()).getNo());
		request.setAttribute("title",dto.View(Mitem.getNo()).getTitle());
		request.setAttribute("body",dto.View(Mitem.getNo()).getBody());
		request.setAttribute("wdate",dto.View(Mitem.getNo()).getWdate());
		request.setAttribute("hit",dto.View(Mitem.getNo()).getHit());
		request.setAttribute("file",dto.View(Mitem.getNo()).getFile());
		
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
