package site.namsu.sweng.core.service;

import org.springframework.stereotype.Component;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.entity.User;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-05 오후 8:54
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@SuppressWarnings("unchecked")
public class CheckService {

    private Dao<User> dao = Dao.of(User.class);

    public User isSignedOrNull(User reqUser) {
        User dbUser = dao.select(reqUser);

        if (dbUser == null)
            return null;
        else if (reqUser.getPassword().equals(dbUser.getPassword()))
            return dbUser;
        else
            return null;
    }

    public boolean isAdmin(User user) {
        if (user == null) return false;
        else {
            User dbUser = dao.select(user);
            return dbUser.isAdmin();
        }
    }

    public boolean isCorrectEmail(User user) {
        User dbUser = dao.select(user);
        if (dbUser == null) return false;
        else return dbUser.getEmail().equals(user.getEmail())
                && dbUser.getName().equals(user.getName());
    }
}
