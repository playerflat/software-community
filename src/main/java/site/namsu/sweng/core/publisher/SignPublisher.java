package site.namsu.sweng.core.publisher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import site.namsu.sweng.core.entity.User;
import site.namsu.sweng.core.service.SignInService;
import site.namsu.sweng.core.service.SignUpService;
import site.namsu.sweng.rx.publisher.Publisher;
import site.namsu.sweng.util.View;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오전 1:46
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@RestController
public class SignPublisher {

    @Autowired private SignInService signInService;
    @Autowired private SignUpService signUpService;

    @PostMapping("sign_in.do")
    public Publisher<User> signInPublish(User req) {
        return Publisher.springThread(req)
                .next(input -> System.out.println("AAAAA"))
                .map(input -> signInService.getDbUser(input))
                .map(input -> input);
    }

    @PostMapping("sign_up.do")
    public Publisher<User> signUpPublish(User req) {
        return Publisher.springThread();
    }
}