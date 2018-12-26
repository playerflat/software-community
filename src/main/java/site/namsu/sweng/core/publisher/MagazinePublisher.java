package site.namsu.sweng.core.publisher;

import lombok.AllArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import site.namsu.sweng.core.entity.Magazine;
import site.namsu.sweng.core.service.LoadService;
import site.namsu.sweng.core.service.StoreService;
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

    private LoadService readService;
    private StoreService storeService;

    @PostMapping("magazine_load.do")
    public Publisher<List<Magazine>> magazineLoadPublish() {
<<<<<<< HEAD
        return Mono.background(Magazine.class)
                .map(readService::loadAll);
=======
        return Mono.background(readService.loadAll(Magazine.class));
>>>>>>> fd77a0895573647e476c1da2a7dacbe7b50d612a
    }

    @PostMapping("magazine_write.do")
    public Flow.Publisher<Boolean> magazineWritePublish(@NonNull Magazine req) {
        return Mono.main(req)
                .map(storeService::storeSuccessful);
    }
}