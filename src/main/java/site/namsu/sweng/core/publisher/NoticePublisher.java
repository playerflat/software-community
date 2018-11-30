package site.namsu.sweng.core.publisher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import site.namsu.sweng.core.entity.Board;
import site.namsu.sweng.core.entity.Notice;
import site.namsu.sweng.core.entity.User;
import site.namsu.sweng.core.service.NoticeReadService;
import site.namsu.sweng.core.service.NoticeWriteService;
import site.namsu.sweng.rx.publisher.Publisher;
import site.namsu.sweng.util.View;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오후 2:33
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@Controller
public class NoticePublisher {

    @Autowired private NoticeReadService readService;
    @Autowired private NoticeWriteService writeService;

    @PostMapping("notice_read.do")
    public Publisher<List<Board>> boardRead(Model model) {
        return Publisher.springThread();
    }

    @PostMapping("notice_write.do")
    public Publisher boardWrite(Notice notice, Model model) {
        return Publisher.springThread();
    }
}