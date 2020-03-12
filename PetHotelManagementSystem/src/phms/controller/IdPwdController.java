package phms.controller;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import phms.dto.UserDto;
import phms.service.UserService;

@Controller
@RequestMapping("/idpwd")
public class IdPwdController {

	@Autowired
	UserService userService;
	
	@RequestMapping("/search")
	public String search() {
		return "IdPwdSearch";
	}
	
	@RequestMapping(value = "/idSearch", produces = "application/text; charset=utf8")
	public @ResponseBody String idSearch(String name, String eMail) {
		System.out.println("ddD??D?");
		System.out.println(name);
		System.out.println(eMail);
		List<UserDto> userList = userService.selectAllUser();
		
		for (int i = 0; i < userList.size(); i++) {	
			
			String uName = userList.get(i).getuName();
			String uEmail = userList.get(i).getuEmail();
			
			if(uName.equals(name) && uEmail.equals(eMail)) {
				
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
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(eMail));
					message.setSubject("PHMS 귀하의 아이디 입니다");
					message.setText("인증 번호"+userList.get(i).getuId()+"입니다");

					Transport.send(message);

				} catch (MessagingException e) {
					throw new RuntimeException(e);
				}
				
				return "아이디 전송완료";
			
			}else if(uName.equals(name) && (!uEmail.equals(eMail))){
				return "등록된 이메일이 다릅니다";
			}
		}
		return "실패";	
	}
	
	String authKey = ((int)((Math.random()*999999)*1))+""; 
	String copykey = authKey;
	
	@RequestMapping(value = "/pwdSearch", produces = "application/text; charset=utf8")
	public @ResponseBody String pwdSearch(String id, String eMail) {
		System.out.println(id);
		System.out.println(eMail);
		System.out.println(authKey);
		System.out.println(copykey);
		List<UserDto> userList = userService.selectAllUser();
		for (int i = 0; i < userList.size(); i++) {	
			
			String uId = userList.get(i).getuId();
			String uEmail = userList.get(i).getuEmail();
						
			if(uId.equals(id) && uEmail.equals(eMail)) {
				
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
				
				UserDto user = userService.selectOneUser(id);
				
				user.setuPwd(copykey);
				
				userService.updateUser(user);
						
				try {

					Message message = new MimeMessage(session);
					message.setFrom(new InternetAddress(username));
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(eMail));
					message.setSubject("PHMS 귀하의 임시비밀번호 입니다");
					message.setText("인증 번호"+copykey+"입니다");

					Transport.send(message);

				} catch (MessagingException e) {
					throw new RuntimeException(e);
				}
				
				return "임시비밀번호 전송완료";
			
			}else if(uId.equals(id) && (!uEmail.equals(eMail))){
				return "등록된 이메일이 다릅니다";
			}
		}
		return "실패";
	}
}
