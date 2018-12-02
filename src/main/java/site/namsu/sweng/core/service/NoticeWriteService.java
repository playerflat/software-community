package site.namsu.sweng.core.service;

import org.springframework.stereotype.Component;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.dao.BoardDao;
import site.namsu.sweng.core.dao.NoticeDao;
import site.namsu.sweng.core.entity.Board;
import site.namsu.sweng.core.entity.Notice;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오후 2:42
 * @Homepage : https://github.com/gusdnd852
 */
@Component
public class NoticeWriteService {

    private final Dao<Notice> dao = Dao.of(NoticeDao.class);

    public boolean writeSuccessful(Notice notice) {
        if (notice != null)
            return dao.insert(notice);
        else
            return false;
    }
}