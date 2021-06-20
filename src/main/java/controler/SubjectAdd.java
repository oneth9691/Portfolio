package controler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.SubjectDTO;

/**
 * Servlet implementation class SubjectAdd
 */
@WebServlet("/SubjectAdd.do")
public class SubjectAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");


		String sj_name = request.getParameter("sj_name");
		String sj_start = request.getParameter("sj_start");
		String sj_end = request.getParameter("sj_end");
		
		SubjectDTO dto = new SubjectDTO();
		
		dto.add(sj_name,sj_start,sj_end) ;
		
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
