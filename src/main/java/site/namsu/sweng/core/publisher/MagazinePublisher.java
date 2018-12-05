package site.namsu.sweng.core.publisher;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import site.namsu.sweng.core.entity.Magazine;
import site.namsu.sweng.core.service.LoadService;
import site.namsu.sweng.core.service.WriteService;
import site.namsu.sweng.rx.publisher.Empty;
import site.namsu.sweng.rx.publisher.Mono;
import site.namsu.sweng.rx.publisher.Publisher;

import java.util.List;
import java.util.concurrent.Flow;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오후 2:33
 * @Homepage : https://github.com/gusdnd852
 */
@RestController
@Component
@AllArgsConstructor
public class MagazinePublisher {

    @Autowired private LoadService readService;
    @Autowired private WriteService writeService;

    @PostMapping("magazine_load.do")
    public Publisher<List<Magazine>> magazineLoadPublish() {
        return Empty.background()
                .map(req -> readService.load(Magazine.class));
    }

    @PostMapping("magazine_write.do")
    public Flow.Publisher<Boolean> magazineWritePublish(@NonNull Magazine req) {
        return Mono.main(req)
                .map(writeService::writeSuccessful);
    }
}