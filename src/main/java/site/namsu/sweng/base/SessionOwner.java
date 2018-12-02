package site.namsu.sweng.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-02 오후 1:23
 * @Homepage : https://github.com/gusdnd852
 */
@SuppressWarnings("unchecked")
@Component
public class SessionOwner {
    @Autowired HttpSession session;

    public void store(String key, String value) {
        session.setAttribute(key, value);
        session.setMaxInactiveInterval(60 * 60);
    }

    public <T> T read(String key, Class<T> clazz) {
        return (T) session.getAttribute(key);
    }
}
