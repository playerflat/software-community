package site.namsu.sweng.core.publisher;

import lombok.AllArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import site.namsu.sweng.core.entity.User;
import site.namsu.sweng.core.service.*;
import site.namsu.sweng.rx.publisher.Mono;

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
public class SignPublisher {

    private CheckService checkService;
    private StoreService storeService;
    private SessionService sessionService;
    private EncodeService encodeService;

    @PostMapping("sign_in.do")
    public Flow.Publisher<User> signInPublish(@NonNull User req) {
        return Mono.main(req)
                .map(encodeService::encodePassword)
                .map(checkService::isSignedOrNull)
                .filter(Objects::nonNull)
                .next(db -> sessionService.store("stdNumber", db.getStdNumber()))
                .next(db -> sessionService.store("name", db.getName()))
                .next(db -> sessionService.store("email", db.getEmail()));
    }

    @PostMapping("sign_up.do")
    public Flow.Publisher<Boolean> signUpPublish(@NonNull User req) {
        return Mono.main(req)
                .map(encodeService::encodePassword)
                .map(storeService::storeSuccessful);
    }
}

