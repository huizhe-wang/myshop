package com.shop.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Send E-mail
 */
public class MailUitls {
	/**
	 * the method of send email
	 * @param to	:receiver
	 * @param code	:CDkey
	 */
	public static void sendMail(String to,String code){
		/**
		 * 1.get a session object.
		 * 2.build Message object.
		 * 3.send email Transport
		 */
		// 1.get linked object
		Properties props = new Properties();
		//set localhost
		props.setProperty("mail.host", "localhost");
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				//send email
				return new PasswordAuthentication("service@shop.com", "service");
			}
		});
		
		// 2.bulid message object
		Message message = new MimeMessage(session);
		
		try {
			// setFrom
			message.setFrom(new InternetAddress("service@shop.com"));
			// setRecipient
			message.addRecipient(RecipientType.TO, new InternetAddress(to));
			// set Subject
			message.setSubject("The activation code from myShop");
			// set Content
			message.setContent("<h1>Click on the link to finish your activation. </h1><h3><a href='http://localhost:8080/myShop/active/"+code+"'>http://localhost:8080/myShop/active/"+code+"</a></h3>", "text/html;charset=UTF-8");
			// 3.send email
			Transport.send(message);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}
	
	public static void main(String[] args) {
		sendMail("w.huizhe@gmail.com","11111111111111");
	}
}
