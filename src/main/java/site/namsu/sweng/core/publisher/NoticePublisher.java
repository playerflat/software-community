package site.namsu.sweng.core.publisher;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import site.namsu.sweng.core.entity.Notice;
import site.namsu.sweng.core.entity.User;
import site.namsu.sweng.core.service.AdminService;
import site.namsu.sweng.core.service.LoadService;
import site.namsu.sweng.core.service.WriteService;
import site.namsu.sweng.rx.publisher.Empty;
import site.namsu.sweng.rx.publisher.Publisher;
import site.namsu.sweng.rx.publisher.Mono;

import java.util.List;
import java.util.concurrent.Flow;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오후 2:33
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@RestController
@AllArgsConstructor
public class NoticePublisher {

    @Autowired private LoadService loadService;
    @Autowired private WriteService writeService;
    @Autowired private AdminService adminService;

    @PostMapping("notice_load.do")
    public Publisher<List<Notice>> noticeLoadPublish() {
        return Empty.background()
                .map(req -> loadService.load(Notice.class));
    }

    @PostMapping("notice_check.do")
    public Flow.Publisher<Boolean> noticeCheckPublish(@NonNull User req) {
        return Mono.main(req)
                .map(adminService::isAdmin);
    }

    @PostMapping("notice_write.do")
    public Flow.Publisher<Boolean> noticeWritePublish(@NonNull Notice req) {
        return Mono.main(req)
                .map(writeService::writeSuccessful);
    }
}