package site.namsu.sweng.core.service;

import org.springframework.stereotype.Component;
import site.namsu.sweng.core.entity.Auth;
import site.namsu.sweng.core.entity.User;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Date;
import java.util.Properties;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오후 2:31
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@SuppressWarnings("unchecked")
public class MailService {

    public boolean sendResetMailSuccessful(User user) {
        if (user == null) return false;
        String msg = "<h1>아래 링크를 클릭하면 비밀번호를 재설정합니다.</h1>"
                + "<br>"
                + "<h2><a href ="
                + "http://localhost:1234/view/reset_password.jsp"
                + "?stdNumber="
                + user.getStdNumber()
                + ">비밀번호 재설정하기</a></h2>"
                + "<br>";
        return send(msg, user.getEmail());
    }

    private static boolean send(String message, String mailTo) {
        String mailHost = "smtp.naver.com"; //네이버메일
        String mailAccId = "mingusbob"; // 메일보내는이
        String mailAccPwd = "Software!1"; // 메일비밀번호
        String sendMailAdd = "mingusbob@naver.com"; // 보내는이주소
        String mailTitle = "비밀번호를 재설정해주세요.";

        Authenticator auth = new Auth(mailAccId, mailAccPwd);
        Properties props = new Properties();
        props.put("mail.smtp.host", mailHost);
        props.put("mail.smtp.auth", "true");
        Session session = Session.getInstance(props, auth);
        Transport transport = null;

        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(sendMailAdd, sendMailAdd));
            msg.setHeader("content-type", "text/html;charset=utf-8");
            InternetAddress[] toAddress = InternetAddress.parse(mailTo);
            msg.setRecipients(Message.RecipientType.TO, toAddress);
            msg.setSubject(mailTitle, "UTF-8");
            msg.setSentDate(new Date());
            MimeMultipart mp = new MimeMultipart();
            MimeBodyPart mbp1 = new MimeBodyPart();
            mbp1.setContent(message, "text/html; charset=utf-8");
            mp.addBodyPart(mbp1);
            msg.setContent(mp);
            transport = session.getTransport("smtp");
            Transport.send(msg);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                transport.close();
            } catch (MessagingException e) {
                e.printStackTrace();
            }
        }
    }
}
