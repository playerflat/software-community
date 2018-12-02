package site.namsu.sweng.core.publisher;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import site.namsu.sweng.base.SessionOwner;
import site.namsu.sweng.core.entity.User;
import site.namsu.sweng.core.service.SignInService;
import site.namsu.sweng.core.service.SignUpService;
import site.namsu.sweng.rx.publisher.Publisher;

import java.util.Objects;
import java.util.concurrent.Flow;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오전 1:46
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@RestController
@AllArgsConstructor
public class SignPublisher extends SessionOwner {

    @Autowired private SignInService signInService;
    @Autowired private SignUpService signUpService;

    @PostMapping("sign_in.do")
    public Publisher<User> signInPublish(User req) {
        return Publisher.mainThread(req)
                .map(signInService::getDbUser)
                .switchIfEmpty(db -> signInService.isSigned(req, db))
                .filter(Objects::nonNull)
                .next(db -> store("stdNumber", db.getStdNumber()))
                .next(db -> store("name", db.getName()));
    }

    @PostMapping("sign_up.do")
    public Publisher<Boolean> signUpPublish(User req) {
        return Publisher.mainThread(req)
                .map(signUpService::encodePassword)
                .map(signUpService::storeSuccessful);
    }
}