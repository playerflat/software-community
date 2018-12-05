package site.namsu.sweng.core.dao;

import site.namsu.sweng.base.Accessor;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.entity.Board;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오후 2:50
 * @Homepage : https://github.com/gusdnd852
 */
@SuppressWarnings("unchecked")
public class BoardDao extends Accessor implements Dao<Board> {

    @Override public Board select(Board input) {
        return SQL("select * from  mingus.board where boardNumber = ?")
                .param(db -> db.setInt(1, input.getBoardNumber()))
                .map(db -> Board.builder()
                        .boardNumber(db.getInt("boardNumber"))
                        .stdNumber(db.getString("stdNumber"))
                        .name(db.getString("name"))
                        .title(db.getString("title"))
                        .contents(db.getString("contents"))
                        .date(db.getString("date"))
                        .build())
                .getOnce(Board.class);
    }

    public List<Board> selectAll() {
        return SQL("select * from  mingus.board")
                .map(db -> Board.builder()
                        .boardNumber(db.getInt("boardNumber"))
                        .stdNumber(db.getString("stdNumber"))
                        .name(db.getString("name"))
                        .title(db.getString("title"))
                        .contents(db.getString("contents"))
                        .date(db.getString("date"))
                        .build())
                .getList(Board.class);
    }

    public boolean insert(Board input) {
        return SQL("insert into mingus.board values (?,?,?,?,?,?)")
                .param(db -> db.setInt(1, input.getBoardNumber()))
                .param(db -> db.setString(2, input.getStdNumber()))
                .param(db -> db.setString(3, input.getName()))
                .param(db -> db.setString(4, input.getTitle()))
                .param(db -> db.setString(5, input.getContents()))
                .param(db -> db.setString(6, input.getDate()))
                .set();
    }

    public boolean update(Board input, final String property, final String value) {
        return SQL("update mingus.board set " + property + " = ?" + "where  boardNumber = ?")
                .param(db -> db.setString(1, value))
                .param(db -> db.setInt(2, input.getBoardNumber()))
                .set();
    }

    public boolean delete(Board input) {
        return SQL("delete from mingus.board where + ?")
                .param(db -> db.setInt(1, input.getBoardNumber()))
                .set();
    }
}
