package site.namsu.sweng.core.publisher;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.Flow;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-03 오후 11:20
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@RestController
@AllArgsConstructor
public class SettingPublisher {

    @PostMapping("reset_email.do")
    public Flow.Publisher resetEmailPublish() {
        return null;
    }
}
