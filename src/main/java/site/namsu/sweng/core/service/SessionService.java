package site.namsu.sweng.core.service;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import site.namsu.sweng.core.entity.User;

import javax.servlet.http.HttpSession;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-05 오후 9:04
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@AllArgsConstructor
public class SessionService {

    @Autowired private HttpSession session;

    public void signInStore(User user) {
        this.store("stdNumber", user.getStdNumber());
        this.store("name", user.getName());
        this.store("email", user.getEmail());
    }

    public void store(String key, Object val) {
        session.setAttribute(key, val);
        session.setMaxInactiveInterval(60 * 60);
    }

    public Object read(String key) {
        return session.getAttribute(key);
    }

    public void remove(String key) {
        session.removeAttribute(key);
    }

    public void invalidate() {
        session.invalidate();
    }
}
