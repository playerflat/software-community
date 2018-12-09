package site.namsu.sweng.core.publisher;

import lombok.AllArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import site.namsu.sweng.core.entity.User;
import site.namsu.sweng.core.service.MailService;
import site.namsu.sweng.rx.publisher.Mono;

import java.util.concurrent.Flow;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-10 오전 6:53
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@RestController
@AllArgsConstructor
public class ContactPublisher {

    private MailService mailService;

    @PostMapping("contact_us.do")
    public Flow.Publisher<Boolean> forgotPasswordPublish(@NonNull User req,
                                                         @RequestParam("msg") String msg) {
        return Mono.main(req)
                .map(user -> mailService.sendContactMailSuccessful(user, msg));
    }
}
