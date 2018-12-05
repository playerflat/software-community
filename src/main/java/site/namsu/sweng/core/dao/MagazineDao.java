package site.namsu.sweng.core.dao;


import site.namsu.sweng.base.Accessor;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.entity.Magazine;

import java.util.ArrayList;
import java.util.List;

public class MagazineDao extends Accessor implements Dao<Magazine> {

    @Override
    public Magazine select(Magazine input) {
        return SQL("select * from mingus.magazine where magazineNumber = ?")
                .param(db -> db.setInt(1, input.getMagazineNumber()))
                .map(db -> Magazine.builder()
                        .magazineNumber(db.getInt("magazineNumber"))
                        .stdNumber(db.getString("stdNumber"))
                        .name(db.getString("name"))
                        .title(db.getString("title"))
                        .contents(db.getString("contents"))
                        .date(db.getString("date"))
                        .build())
                .getOnce(Magazine.class);
    }

    @Override
    public List<Magazine> selectAll() {
        return SQL("select *from mingus.magazine")
                .map(db -> Magazine.builder()
                        .magazineNumber(db.getInt("magazineNumber"))
                        .stdNumber(db.getString("stdNumber"))
                        .name(db.getString("name"))
                        .title(db.getString("title"))
                        .contents(db.getString("contents"))
                        .date(db.getString("date"))
                        .build())
                .getList(Magazine.class);
    }

    @Override
    public boolean insert(Magazine input) {
        return SQL("insert into mingus.magazine values (?,?,?,?,?,?)")
                .param(db -> db.setInt(1, input.getMagazineNumber()))
                .param(db -> db.setString(2, input.getStdNumber()))
                .param(db -> db.setString(3, input.getTitle()))
                .param(db -> db.setString(4, input.getName()))
                .param(db -> db.setString(5, input.getContents()))
                .param(db -> db.setString(6, input.getDate()))
                .set();
    }

    @Override
    public boolean update(Magazine input, String property, String value) {
        return SQL("update mingus.magazine set " + property + " = ?" + "where magazineNumber = ?")
                .param(db -> db.setString(1, value))
                .param(db -> db.setInt(2, input.getMagazineNumber()))
                .set();
    }

    @Override
    public boolean delete(Magazine input) {
        return SQL("delete from mingus.magazine where + ?")
                .param(db -> db.setInt(1, input.getMagazineNumber()))
                .set();
    }
}
