package controler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.DupleDTO;

/**
 * Servlet implementation class DuplicationCheck
 */
@WebServlet("/DuplicationCheck.do")
public class DuplicationCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DuplicationCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		String idtxt = request.getParameter("idtxt");
		DupleDTO dp = new DupleDTO();
		if(dp.duple_check_id(idtxt) == true)
		{
			response.getWriter().write("true");
		}
		else if(dp.duple_check_id(idtxt) == false)
		{
			response.getWriter().write("false");
		}
		
		System.out.println("중복 true or false : " +  dp.duple_check_id(idtxt));

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
