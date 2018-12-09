package site.namsu.sweng.core.publisher;

import lombok.AllArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import site.namsu.sweng.core.entity.User;
import site.namsu.sweng.core.service.CheckService;
import site.namsu.sweng.core.service.EncodeService;
import site.namsu.sweng.core.service.MailService;
import site.namsu.sweng.core.service.ResetService;
import site.namsu.sweng.rx.publisher.Mono;

import java.util.concurrent.Flow;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오전 10:13
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@RestController
@AllArgsConstructor
public class ResetPublisher {

    private CheckService checkService;
    private ResetService resetService;
    private MailService mailService;
    private EncodeService encodeService;

    @PostMapping("forgot_password.do")
    public Flow.Publisher<Boolean> forgotPasswordPublish(@NonNull User req) {
        return Mono.main(req)
                .filter(checkService::isCorrectEmail)
                .map(mailService::sendResetMailSuccessful);
    }

    @PostMapping("reset_password.do")
    public Flow.Publisher<Boolean> resetPasswordPublish(@NonNull User user) {
        return Mono.main(user)
                .map(encodeService::encodePassword)
                .map(resetService::resetPassword);
    }

    @PostMapping("reset_email.do")
    public Flow.Publisher<Boolean> resetEmailPublish(@NonNull User user) {
        return Mono.main(user)
                .map(resetService::resetEmail);
    }
}