package site.namsu.sweng.core.dao;

import site.namsu.sweng.base.Accessor;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.entity.Group;

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
        return false;
    }

    @Override
    public boolean update(Group input, String property, String value) {
        return false;
    }

    @Override
    public boolean delete(Group input) {
        return false;
    }
}
