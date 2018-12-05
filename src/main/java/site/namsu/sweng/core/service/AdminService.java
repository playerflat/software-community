package site.namsu.sweng.core.service;

import org.springframework.stereotype.Component;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.dao.UserDao;
import site.namsu.sweng.core.entity.User;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-03 오후 7:23
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@SuppressWarnings("unchecked")
public class AdminService {

    public boolean isAdmin(User user) {
        if (user == null) return false;
        else {
            Dao<User> dao = Dao.of(user);
            User dbUser = dao.select(user);
            return dbUser.isAdmin();
        }
    }
}
