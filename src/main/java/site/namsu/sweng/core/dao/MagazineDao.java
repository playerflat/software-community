package site.namsu.sweng.core.dao;


import site.namsu.sweng.base.Accessor;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.entity.Magazine;

import java.util.ArrayList;
import java.util.List;

public class MagazineDao extends Accessor implements Dao<Magazine> {


    @Override
    public Magazine select(Magazine input) {
        return SQL("select * form mingus.magazine where magazineNumber = ?")
                .param(db -> db.setInt(1, input.getMagazineNumber()))
                .map(db -> Magazine.builder()
                        .magazineNumber(db.getInt("magazineNumber"))
                        .title(db.getString("title"))
                        .text(db.getString("text"))
                        .date(db.getString("date"))
                        .build())
                .get(Magazine.class);
    }

    @Override
    public List<Magazine> selectAll() {
        return SQL("select *form mingus.magazine")
                .map(db -> {
                    List<Magazine> list = new ArrayList<>();
                    while(db.next()) {
                        Magazine magazine = Magazine.builder()
                                .magazineNumber(db.getInt("magazineNumber"))
                                .title(db.getString("title"))
                                .text(db.getString("text"))
                                .date(db.getString("date"))
                                .build();
                        list.add(magazine);
                    }
                    return list;
                })
                .get(List.class);
    }

    @Override
    public boolean insert(Magazine input) {
        return SQL("insert into mingus.magazine values (?,?,?,?)")
                .param(db -> db.setInt(1, input.getMagazineNumber()))
                .param(db -> db.setString(2, input.getTitle()))
                .param(db -> db.setString(3, input.getText()))
                .param(db -> db.setString(4, input.getDate()))
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
