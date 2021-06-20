package controler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dto.NoticeDTO;
import vo.NoticeVO;

/**
 * Servlet implementation class write
 */
@WebServlet("/write.do")
@MultipartConfig(maxFileSize=1024*1024*2, location="c:\\fileupload")
public class Write extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Write() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
		
		response.setContentType("text/html; charset=UTF-8");	

		Part part = request.getPart("file_name");
	    String fileName = getFilename(part);
	    fileName = fileName.trim();
	    if(fileName != null && !fileName.isEmpty())
	    {
	            part.write(fileName);
	    }
		
		String title = request.getParameter("title");
		String body = request.getParameter("body");
		System.out.println(title);
		System.out.println(body);
		System.out.println(fileName);
		
		NoticeDTO dto = new NoticeDTO();
		NoticeVO item = new  NoticeVO();
		item.setTitle(title);
		item.setBody(body);
		item.setFile(fileName);
		dto.Write(item);

		System.out.println(dto.getNo());
		response.sendRedirect("/View.do?no=" + dto.getNo());	
	}
	private String getFilename(Part part)
	{
		
        String fileName = null;        
        String contentDispositionHeader = part.getHeader("content-disposition");
        System.out.println(" part.getHeader :"+part.getHeader("content-disposition"));
        //part.getHeader :form-data; name="theFile"; 
        //filename="RHDSetup.log" 처럼 헤더가 나옴 따라서 세미콜론마다 지워야 할 필요성이 있음
        String [] elements = contentDispositionHeader.split(";");
    
        for(String element: elements)
        {
            System.out.println("서브스트링 전:" +element);
            fileName = element.substring(element.indexOf('=')+1);
            System.out.println("트림 전:"+fileName);
            fileName = fileName.trim().replace("\""," "); // " <- 쌍따옴표 지움
            System.out.println("트림 후:"+fileName);
        }        
        return fileName;        
    }
}
