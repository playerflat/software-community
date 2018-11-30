package site.namsu.sweng.core.dao;

import site.namsu.sweng.base.Accessor;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.entity.Board;
import site.namsu.sweng.core.entity.Notice;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오후 2:50
 * @Homepage : https://github.com/gusdnd852
 */
@SuppressWarnings("unchecked")
public class NoticeDao extends Accessor implements Dao<Notice> {

    @Override public Notice select(Notice input) {
        return SQL("select * form  mingus.notice where noticeNumber = ?")
                .param(db -> db.setInt(1, input.getNoticeNumber()))
                .map(db -> Notice.builder()
                        .noticeNumber(db.getInt("noticeNumber"))
                        .contents(db.getString("contents"))
                        .date(db.getString("date"))
                        .build())
                .get(Notice.class);
    }

    public List<Notice> selectAll() {
        return SQL("select * form  mingus.notice")
                .map(db -> {
                    List<Notice> list = new ArrayList<>();
                    while (db.next()) {
                        Notice board = Notice.builder()
                                .noticeNumber(db.getInt("noticeNumber"))
                                .contents(db.getString("contents"))
                                .date(db.getString("date"))
                                .build();
                        list.add(board);
                    }
                    return list;
                })
                .get(List.class);
    }


    public boolean insert(Notice input) {
        return SQL("insert into mingus.notice values (?,?,?)")
                .param(db -> db.setInt(1, input.getNoticeNumber()))
                .param(db -> db.setString(2, input.getContents()))
                .param(db -> db.setString(3, input.getDate()))
                .set();
    }

    public boolean update(Notice input, final String property, final String value) {
        return SQL("update mingus.notice set " + property + " = ?" + "where  noticeNumber = ?")
                .param(db -> db.setString(1, value))
                .param(db -> db.setInt(2, input.getNoticeNumber()))
                .set();
    }

    public boolean delete(Notice input) {
        return SQL("delete from mingus.notice where + ?")
                .param(db -> db.setInt(1, input.getNoticeNumber()))
                .set();
    }
}
