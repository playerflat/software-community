package site.namsu.sweng.core.entity;

import lombok.Getter;
import lombok.NonNull;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오후 2:53
 * @Homepage : https://github.com/gusdnd852
 */
@Getter
public class Auth extends Authenticator {

     private PasswordAuthentication passwordAuthentication;

    public Auth(String id, String pwd) {
        passwordAuthentication = new PasswordAuthentication(id, pwd);
    }
}
