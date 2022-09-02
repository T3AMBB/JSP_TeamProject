package dao;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import vo.EmailVO;

public class EmailDAO {
   public int email(EmailVO vo) {

      String host = "smtp.naver.com"; // 사용할 사이트
      final String user = "lisa052@naver.com"; // ID
      final String password = "rnrql0607!"; // PW

      // String to = "lisa23@kakao.com"; // 보낼 이메일 주소
      String to = vo.getEmailAddress();
      
      
      // Get the session object
      Properties props = new Properties();
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.port", "587");
      props.put("mail.smtp.ssl.protocols", "TLSv1.2");

      Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(user, password);
         }
      });

      // Compose the message
      try {
         MimeMessage message = new MimeMessage(session);
         message.setFrom(new InternetAddress(user));
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

         // Subject
         message.setSubject("[Bookster 북스터] 회원탈퇴 메일 입니다.");

         // Text
         message.setText("북스터 회원 탈퇴가 완료 되었습니다. \n 그 동안 이용해 주셔서 감사 드립니다. \n 더욱 노력하는 북스터가 되겠습니다.");

         // send the message
         Transport.send(message);
         System.out.println("이메일 전송 성공!");

         return 1; // 성공 시 1 리턴
      } catch (MessagingException e) {
         e.printStackTrace();
         return 0; // 실패 시 0 리턴
      }
  		
      
   }
}