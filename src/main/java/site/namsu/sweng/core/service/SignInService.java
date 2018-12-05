package site.namsu.sweng.core.service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.dao.UserDao;
import site.namsu.sweng.core.entity.User;
import site.namsu.sweng.util.Encoder;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오전 3:12
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@SuppressWarnings("unchecked")
public class SignInService {

    public User getDbUser(User user) {
        Dao<User> dao = Dao.of(user);
        return dao.select(user);
    }

    public boolean isSigned(User reqUser, User dbUser) {
        if (dbUser == null) return false;
        else return Encoder.SHA256(reqUser.getPassword())
                .equals(dbUser.getPassword());
    }
}