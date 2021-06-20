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
 * Servlet implementation class modify_view
 */
@WebServlet("/Modify_view.do")
public class Modify_view extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modify_view() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 String no = request.getParameter("no");
		 System.out.println("modify_view no:" + no);
		 
		 NoticeDTO dto = new NoticeDTO();

		 dto.Modify_view(no);
		 request.setAttribute("no",dto.Modify_view(no).getNo());
		 request.setAttribute("title",dto.Modify_view(no).getTitle());
		 request.setAttribute("body",dto.Modify_view(no).getBody());
		 request.setAttribute("file",dto.Modify_view(no).getFile());
		 RequestDispatcher rd = request.getRequestDispatcher("/board/modify.jsp");
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
