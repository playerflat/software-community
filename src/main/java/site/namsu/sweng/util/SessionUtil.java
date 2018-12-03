package site.namsu.sweng.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-03 오후 8:43
 * @Homepage : https://github.com/gusdnd852
 */
public class SessionUtil {

    public static void store(HttpSession session, String key, String val) {
        session.setAttribute(key, val);
    }

    public static boolean check(HttpSession session, String key) {
        if (session.getAttribute(key) == null) {
            return false;
        } else {
            session.setAttribute(key, session.getAttribute(key));
            return true;
        }
    }

    public static Object read(HttpSession session, String key) {
        return session.getAttribute(key);
    }

    public static void remove(HttpSession session, String key) {
        session.removeAttribute(key);
    }

    public void invalidate(HttpSession session) {
        session.invalidate();
    }
}
