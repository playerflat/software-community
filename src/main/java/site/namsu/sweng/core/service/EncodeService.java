package site.namsu.sweng.core.service;

import org.springframework.stereotype.Component;
import site.namsu.sweng.core.entity.User;

import java.security.MessageDigest;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-05 오후 9:22
 * @Homepage : https://github.com/gusdnd852
 */
@Component
public class EncodeService {

    public User encodePassword(User user) {
        return User.builder()
                .stdNumber(user.getStdNumber())
                .name(user.getName())
                .email(user.getEmail())
                .password(SHA256(user.getPassword()))
                .admin(user.isAdmin())
                .build();
    }

    private String SHA256(String message) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(message.getBytes());
            byte byteData[] = md.digest();
            StringBuilder hexString = new StringBuilder();
            for (byte aByteData : byteData) {
                String hex = Integer.toHexString(0xff & aByteData);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }
}
