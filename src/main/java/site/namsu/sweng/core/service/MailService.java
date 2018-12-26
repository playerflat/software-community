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
import java.util.List;
import java.util.Properties;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오후 2:31
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@SuppressWarnings("unchecked")
public class MailService {

    public boolean sendContactMailSuccessful(List<Object> msgSet) {
        User user = (User) msgSet.get(0);
        String msg = (String) msgSet.get(1);

        if (user == null) return false;
        String contactMsg =
                user.getName() + "@" + user.getStdNumber() + "님이 보내신 문의 메일입니다."
                        + "<br>"
                        + "회신메일주소 : " + user.getEmail()
                        + "<br>"
                        + msg;

        return send(user.getName() + "님께서 보내신 문의 메일입니다.", contactMsg, "mingusbob@naver.com");
    }

    public boolean sendResetMailSuccessful(User user) {
        if (user == null) return false;
        String msg = "<h1>아래 링크를 클릭하면 비밀번호를 재설정합니다.</h1>"
                + "<br>"
                + "<h2><a href ="
                + "http://namsu.site:9891/view/reset_password.jsp"
                + "?stdNumber="
                + user.getStdNumber()
                + ">비밀번호 재설정하기</a></h2>"
                + "<br>";
        return send("비밀번호를 재설정해주세요.", msg, user.getEmail());
    }

    private static boolean send(String title, String message, String mailTo) {
        String mailHost = "smtp.naver.com"; //네이버메일
        String mailAccId = "mingusbob"; // 메일보내는이
        String mailAccPwd = "software"; // 메일비밀번호
        String sendMailAdd = "mingusbob@naver.com"; // 보내는이주소

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
            msg.setSubject(title, "UTF-8");
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
