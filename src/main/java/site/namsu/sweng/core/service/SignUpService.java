package site.namsu.sweng.core.service;

import org.springframework.stereotype.Component;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.dao.UserDao;
import site.namsu.sweng.core.entity.User;
import site.namsu.sweng.util.Encoder;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오전 3:45
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@SuppressWarnings("unchecked")
public class SignUpService {

    public boolean storeSuccessful(User user) {
        return Dao.of(user).insert(user);
    }

    public User encodePassword(User user) {
        return User.builder()
                .stdNumber(user.getStdNumber())
                .name(user.getName())
                .email(user.getEmail())
                .password(Encoder.SHA256(user.getPassword()))
                .admin(user.isAdmin())
                .build();
    }
}