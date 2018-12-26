package site.namsu.sweng.core.service;

import org.springframework.stereotype.Component;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.entity.User;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오후 2:31
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@SuppressWarnings("unchecked")
public class ResetService {

    public boolean resetPassword(User user) {
        return Dao.of(user)
                .update(user, "password", user.getPassword());
    }

    public boolean resetEmail(User user) {
        return Dao.of(user)
                .update(user, "email", user.getEmail());
    }
}

