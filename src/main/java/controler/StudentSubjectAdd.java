package controler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.SubjectDTO;
import vo.Student_SubjectVO;

/**
 * Servlet implementation class StudentSubjectAdd
 */
@WebServlet("/StudentSubjectAdd.do")
public class StudentSubjectAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentSubjectAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		String[] value = request.getParameterValues("new_check");
		String subject = request.getParameter("op");
		
		Student_SubjectVO item = new Student_SubjectVO();
		item.setValue(value);
		item.setSubject(subject);
		
		SubjectDTO dto = new SubjectDTO();
		dto.student_subject(item);
		
		RequestDispatcher rd = request.getRequestDispatcher("/AdminMain.do");
		rd.forward(request, response);
		
		System.out.println(subject);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
