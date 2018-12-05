package site.namsu.sweng.core.publisher;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import site.namsu.sweng.core.entity.Board;
import site.namsu.sweng.core.service.LoadService;
import site.namsu.sweng.core.service.WriteService;
import site.namsu.sweng.rx.publisher.Empty;
import site.namsu.sweng.rx.publisher.Mono;

import java.util.List;
import java.util.concurrent.Flow;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-03 오전 11:41
 * @Homepage : https://github.com/gusdnd852
 */

@Component
@RestController
@AllArgsConstructor
public class BoardPublisher {

    @Autowired private LoadService loadService;
    @Autowired private WriteService writeService;

    @PostMapping("board_load.do")
    public Flow.Publisher<List<Board>> boardLoadPublish() {
        return Empty.background()
                .map(req -> loadService.load(Board.class));
    }

    @PostMapping("board_write.do")
    public Flow.Publisher<Boolean> boardWritePublish(Board req) {
        return Mono.main(req)
                .map(writeService::writeSuccessful);
    }
}
