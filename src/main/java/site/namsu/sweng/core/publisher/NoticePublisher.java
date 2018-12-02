package site.namsu.sweng.core.publisher;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import site.namsu.sweng.core.entity.Notice;
import site.namsu.sweng.core.service.NoticeReadService;
import site.namsu.sweng.core.service.NoticeWriteService;
import site.namsu.sweng.rx.publisher.Publisher;

import java.util.List;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오후 2:33
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@RestController
@AllArgsConstructor
public class NoticePublisher {

    @Autowired private NoticeReadService readService;
    @Autowired private NoticeWriteService writeService;

    @PostMapping("notice_read.do")
    public Publisher<List> boardRead() {
        return Publisher.mainThread()
                .map(req -> readService.read());
    }

    @PostMapping("notice_write.do")
    public Publisher<Boolean> boardWrite(Notice req) {
        return Publisher.mainThread(req)
                .map(notice -> writeService.writeSuccessful(notice));
    }
}