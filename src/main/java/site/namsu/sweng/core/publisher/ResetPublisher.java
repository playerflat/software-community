package site.namsu.sweng.core.publisher;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import site.namsu.sweng.core.entity.User;
import site.namsu.sweng.core.service.MailService;
import site.namsu.sweng.core.service.ResetService;
import site.namsu.sweng.rx.publisher.Publisher;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오전 10:13
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@RestController
@AllArgsConstructor
public class ResetPublisher {

    @Autowired private ResetService resetService;
    @Autowired private MailService mailService;

    @PostMapping("forgot.do")
    public Publisher<Boolean> forgotPublisher(User req) {
        return Publisher.mainThread(req)
                .switchIfEmpty(mailService::isCorrectUser)
                .map(mailService::sendMailSuccessful);
    }

    @PostMapping("reset.do")
    public Publisher<Boolean> resetPublisher(User user) {
        return Publisher.mainThread(user)
                .map(resetService::resetPassword);
    }
}
