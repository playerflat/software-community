package site.namsu.sweng.core.dao;

import site.namsu.sweng.base.Accessor;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.entity.Group;
import site.namsu.sweng.core.entity.Magazine;

import java.util.List;


@SuppressWarnings("unchecked")
public class GroupDao extends Accessor implements Dao<Group> {

    @Override public Group select(Group input) {
        return SQL("select * from  mingus.groups where groupNumber = ?")
                .param(db -> db.setInt(1, input.getGroupNumber()))
                .map(db -> Group.builder()
                        .groupNumber(db.getInt("groupNumber"))
                        .name(db.getString("groupName"))
                        .build())
                .getOnce(Group.class);
    }

    @Override
    public List<Group> selectAll() {
        return SQL("select * from  mingus.groups")
                .map(db -> Group.builder()
                        .groupNumber(db.getInt("groupNumber"))
                        .name(db.getString("groupName"))
                        .build())
                .getList(Group.class);
    }

    @Override
    public boolean insert(Group input) {
        return SQL("insert into mingus.group values (?,?)")
                .param(db -> db.setInt(1, input.getGroupNumber()))
                .param(db -> db.setString(2, input.getName()))
               .set();
    }

    @Override
    public boolean update(Group input, String property, String value) {
        return SQL("update mingus.group set " + property + " = ?" + "where groupNumber = ?")
                .param(db -> db.setString(1, value))
                .param(db -> db.setInt(2, input.getGroupNumber()))
                .set();
    }

    @Override
    public boolean delete(Group input) {
        return SQL("delete from mingus.group where + ?")
                .param(db -> db.setInt(1, input.getGroupNumber()))
                .set();
    }
}
