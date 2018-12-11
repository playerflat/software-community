package site.namsu.sweng.core.publisher;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import site.namsu.sweng.core.entity.Group;
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

    private final LoadService loadService;
    private final StoreService writeService;

    @PostMapping("message_load.do/{groupName}")
    public Flow.Publisher<List<Message>> messageLoadPublish(@PathVariable String groupName) {
        return Mono.background(loadService.loadAll(Message.class))
                .map(all -> all.stream()
                        .filter(message -> message.getGroupName().equals(groupName))
                        .collect(Collectors.toList()));
    }

    @PostMapping("message_write.do")
    public Flow.Publisher<Boolean> messageWritePublish(Message req) {
        return Mono.main(req)
                .map(writeService::storeSuccessful);
    }

    @PostMapping("group_load.do")
    public Flow.Publisher<List<Group>> groupLoadPublish() {
        return Empty.main()
                .map(req -> loadService.loadAll(Group.class));
    }
}