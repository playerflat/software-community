package site.namsu.sweng.core.publisher;

import lombok.AllArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import site.namsu.sweng.core.entity.User;
import site.namsu.sweng.core.service.SignInService;
import site.namsu.sweng.core.service.SignUpService;
import site.namsu.sweng.rx.publisher.Mono;

import javax.servlet.http.HttpSession;
import java.util.concurrent.Flow;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오전 1:46
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@RestController
@AllArgsConstructor
public class SignPublisher {

    @Autowired private SignInService signInService;
    @Autowired private SignUpService signUpService;

    @PostMapping("sign_in.do")
    public Flow.Publisher<User> signInPublish(@NonNull User req, HttpSession session) {
        return Mono.main(req)
                .map(signInService::getDbUser)
                .switchIfEmpty(db -> signInService.isSigned(req, db))
                .filter(db -> signInService.isSigned(req, db))
                .next(db -> session.setAttribute("stdNumber", db.getStdNumber()))
                .next(db -> session.setAttribute("name", db.getName()));
    }

    @PostMapping("sign_up.do")
    public Flow.Publisher<Boolean> signUpPublish(@NonNull User req) {
        return Mono.main(req)
                .map(signUpService::encodePassword)
                .map(signUpService::storeSuccessful);
    }
}

