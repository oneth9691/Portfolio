package controler;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.FindDTO_pw2;
import vo.UserVO;

/**
 * Servlet implementation class FindPW2
 */
@WebServlet("/FindPW2.do")
public class FindPW2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPW2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		UserVO user2 = new UserVO();
		user2.setUserid(request.getParameter("userid"));
		user2.setEmail(request.getParameter("useremail2"));
		
		FindDTO_pw2 pw2 = new FindDTO_pw2();
			
		String host = "smtp.gmail.com"; final String username = "dhdydtkd0138"; //네이버 이메일 주소중 @ naver.com앞주소만 기재합니다.
		 final String password = "951753tkd!"; //네이버 이메일 비밀번호를 기재합니다. 
		int port=465; // 메일 내용
		String recipient = request.getParameter("useremail2"); //메일을 발송할 이메일 주소를 기재해 줍니다. 
		String subject = "출책을 합시당 비밀번호 찾기"; 
		String body = "회원님의 비밀번호 : " + pw2.pw_ok(user2); 
		
		System.out.println("테스트:" + pw2.pw_ok(user2));
		
		Properties props = System.getProperties(); props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", port); props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host); 
		Session session1 = Session.getDefaultInstance(props, new javax.mail.Authenticator() 
		{ 
			String un=username; String pw=password; protected PasswordAuthentication getPasswordAuthentication() 
			{ return new PasswordAuthentication(un, pw); } 
		}); 
		session1.setDebug(true); //for debug 
		Message mimeMessage = new MimeMessage(session1); 
		
		try {
			mimeMessage.setFrom(new InternetAddress("mong400@naver.com"));
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		try {
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		try {
			mimeMessage.setSubject(subject);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} try {
			mimeMessage.setText(body);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} try {
			Transport.send(mimeMessage);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("/User/find_id_ok.jsp");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
