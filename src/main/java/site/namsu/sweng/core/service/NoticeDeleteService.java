package site.namsu.sweng.core.service;

import org.springframework.stereotype.Component;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.dao.NoticeDao;
import site.namsu.sweng.core.entity.Notice;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-03 오후 9:28
 * @Homepage : https://github.com/gusdnd852
 */
@Component
public class NoticeDeleteService {
    private final Dao<Notice> dao = Dao.of(NoticeDao.class);

    public boolean deleteSuccessful(Notice notice) {
        if (notice != null)
            return dao.delete(notice);
        else
            return false;
    }
}
