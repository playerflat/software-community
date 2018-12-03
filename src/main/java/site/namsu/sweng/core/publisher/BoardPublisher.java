package site.namsu.sweng.core.publisher;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import site.namsu.sweng.core.entity.Board;
import site.namsu.sweng.core.service.BoardDeleteService;
import site.namsu.sweng.core.service.BoardReadService;
import site.namsu.sweng.core.service.BoardWriteService;
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

    @Autowired private BoardReadService readService;
    @Autowired private BoardWriteService writeService;
    @Autowired private BoardDeleteService deleteService;

    @PostMapping("board_read.do")
    public Flow.Publisher<List> readBoard() {
        return Empty.background()
                .map(req -> readService.read());
    }

    @PostMapping("write_board.do")
    public Flow.Publisher<Boolean> writeBoard(Board req) {
        return Mono.main(req)
                .map(writeService::writeSuccessful);
    }


}
