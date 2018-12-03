package site.namsu.sweng.core.service;

import org.springframework.stereotype.Component;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.dao.BoardDao;
import site.namsu.sweng.core.entity.Board;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-03 오후 10:39
 * @Homepage : https://github.com/gusdnd852
 */
@Component
public class BoardWriteService {

    private Dao<Board> dao = Dao.of(BoardDao.class);

    public boolean writeSuccessful(Board board) {
        if (board != null)
            return dao.insert(board);
        else
            return false;
    }
}