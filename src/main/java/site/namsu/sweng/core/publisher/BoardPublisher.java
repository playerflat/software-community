package site.namsu.sweng.core.publisher;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

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
public class BoardPublisher  {

    @PostMapping("board_read.do")
    public Flow.Publisher<List> readBoard() {
        return null;
    }

    @PostMapping("write_board.do")
    public Flow.Publisher<Boolean> writeBoard() {
        return null;
    }
}
