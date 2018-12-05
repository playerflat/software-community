package site.namsu.sweng.core.service;

import org.springframework.stereotype.Component;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.dao.UserDao;
import site.namsu.sweng.core.entity.User;
import site.namsu.sweng.util.Encoder;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오후 2:31
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@SuppressWarnings("unchecked")
public class ResetService {

    public boolean resetPassword(User user) {
        return Dao.of(user).update(user, "password",
                Encoder.SHA256(user.getPassword()));
    }
}
