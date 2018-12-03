package site.namsu.sweng.core.service;

import org.springframework.stereotype.Component;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.dao.BoardDao;
import site.namsu.sweng.core.entity.Board;

import java.util.List;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-03 오후 10:38
 * @Homepage : https://github.com/gusdnd852
 */
@Component
public class BoardReadService {

    private Dao<Board> dao = Dao.of(BoardDao.class);

    public List<Board> read() {
        return dao.selectAll();
    }
}
