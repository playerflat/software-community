package site.namsu.sweng.core.dao;

import site.namsu.sweng.base.Accessor;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.entity.Group;
import site.namsu.sweng.util.Serializer;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-29 오후 1:37
 * @Homepage : https://github.com/gusdnd852
 */

@SuppressWarnings("unchecked")
public class GroupDao extends Accessor implements Dao<Group> {
    @Override public Group select(Group input) {
        return SQL("select * from mingus.group where groupNumber = ?")
                .param(db -> db.setInt(1, input.getGroupNumber()))
                .map(db -> Serializer.deserialize(db, "object"))
                .get(Group.class);
    }

    public List<Group> selectAll() {
        return SQL("select * from mingus.group")
                .map(db -> {
                    List<Group> list = new ArrayList<>();
                    while (db.next())
                        list.add((Group) Serializer.deserialize(db, "object"));
                    return list;
                })
                .get(List.class);
    }

    @Override public boolean insert(Group input) {
        return SQL("insert into mingus.group values(?,?,?)")
                .param(db -> db.setInt(1, input.getGroupNumber()))
                .param(db -> db.setString(2, input.getGroupName()))
                .param(db -> Serializer.serialize(db, input))
                .set();
    }

    @Override public boolean update(Group input, String property, String value) {
        return SQL("update  mingus.group set " + property + " = ?" + "where stdNumber = ?")
                .param(db -> db.setString(1, value))
                .param(db -> db.setInt(2, input.getGroupNumber()))
                .set();
    }

    @Override public boolean delete(Group input) {
        return SQL("delete from mingus.group where + ?")
                .param(db -> db.setInt(1, input.getGroupNumber()))
                .set();
    }
}