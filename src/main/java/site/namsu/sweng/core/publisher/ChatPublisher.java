package site.namsu.sweng.core.publisher;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import site.namsu.sweng.core.entity.Board;
import site.namsu.sweng.core.entity.Message;
import site.namsu.sweng.core.service.LoadService;
import site.namsu.sweng.core.service.StoreService;
import site.namsu.sweng.rx.publisher.Empty;
import site.namsu.sweng.rx.publisher.Mono;

import java.util.List;
import java.util.concurrent.Flow;
import java.util.stream.Collectors;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오후 2:33
 * @Homepage : https://github.com/gusdnd852
 */
@RestController
@Component
@AllArgsConstructor
public class ChatPublisher {
    private LoadService loadService;
    private StoreService writeService;

    @PostMapping("message_load.do")
    public Flow.Publisher<List<Message>> boardLoadPublish() {
//        Empty.background().map(empty -> loadService.loadAll(Message.class)).map(all -> all.stream().filter(all.get(0).getGroupName().equals(req.getGroupName()).collect(Collectors.<Message>toList))

        return Empty.background()
                .map(req -> loadService.loadAll(Message.class));
    }

    @PostMapping("message_write.do")
    public Flow.Publisher<Boolean> boardWritePublish(Message req) {
        return Mono.main(req)
                .map(writeService::storeSuccessful);
    }

}