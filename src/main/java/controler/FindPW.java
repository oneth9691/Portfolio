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

import dto.FindDTO_pw;
import vo.UserVO;

/**
 * Servlet implementation class FindPW
 */
@WebServlet("/FindPW.do")
public class FindPW extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPW() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String a = Integer.toString((int)(Math.random()*100000));
		request.setCharacterEncoding("UTF-8");
		UserVO user = new UserVO();
		user.setUserid(request.getParameter("id")); user.setEmail(request.getParameter("email"));
		
		FindDTO_pw pw = new FindDTO_pw();
		if(pw.find_pw(user) == true)
		{
			String host = "smtp.gmail.com"; final String username = "dhdydtkd0138"; //네이버 이메일 주소중 @ naver.com앞주소만 기재합니다.
			 final String password = "951753tkd!"; //네이버 이메일 비밀번호를 기재합니다. 
			int port=465; // 메일 내용
			String recipient = user.getEmail(); //메일을 발송할 이메일 주소를 기재해 줍니다. 
			String subject = "'출책을 합시당' 비밀번호 찾기 인증번호"; 
			String body = "인증번호 : " + a; 
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
			
			response.getWriter().write(a);
		}
		
			
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
