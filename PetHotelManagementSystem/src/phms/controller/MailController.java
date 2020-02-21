package phms.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/mail")
public class MailController{

	String authKey = ((int)((Math.random()*999999)*1))+""; 
	String copykey = authKey;
	
	@GetMapping("/sendMail")
	public @ResponseBody String sendMail() {
		System.out.println("성공");
		return "sendMail";
	}
	
	@PostMapping("/sendMail")
	public @ResponseBody String sendMail(String uEmail) {
		
		final String username = "com2181@gmail.com";
		final String password = "Worhkd12!@";
		
		System.out.println(uEmail);		
		Properties props = new Properties();
		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.starttls.enable", true);
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.ssl.trust", "*");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});	
				
		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(uEmail));
			message.setSubject("PHMS 인증번호 입니다");
			message.setText("인증 번호"+copykey+"입니다");

			Transport.send(message);

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		
		return "인증코드 전송완료";
		
	}
	@GetMapping("/sendCheck")
	public @ResponseBody String sendCheck() {
		System.out.println("성공");
		
		return "sendCheck";
	}
	
	@PostMapping("/sendCheck")
	public @ResponseBody String sendCheck(String uEmail2) {
		System.out.println(uEmail2.equals(copykey));
		if(uEmail2.equals(copykey)) {
			
			System.out.println("성공");
			
			return "인증 성공";
			
		}
		
		return "인증 실패";
	}
	
	
}
