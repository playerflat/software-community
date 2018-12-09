package site.namsu.sweng.core.publisher;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import site.namsu.sweng.core.entity.Group;
import site.namsu.sweng.core.entity.Message;
import site.namsu.sweng.core.service.LoadService;
import site.namsu.sweng.rx.publisher.Empty;

import java.util.List;
import java.util.concurrent.Flow;

@Component
@RestController
@AllArgsConstructor
public class GroupPublisher {
    private LoadService loadService;

    @PostMapping("group_load.do")
    public Flow.Publisher<List<Group>> boardLoadPublish() {
        return Empty.background()
                .map(req -> loadService.loadAll(Group.class));
    }
}
