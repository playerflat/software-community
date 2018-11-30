package site.namsu.sweng.core.dao;

import site.namsu.sweng.base.Accessor;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.entity.User;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-25 오전 3:14
 * @Homepage : https://github.com/gusdnd852
 */
@SuppressWarnings("unchecked")
public class UserDao extends Accessor implements Dao<User> {

    public User select(User input) {
        return SQL("select * from mingus.member where stdNumber = ?")
                .param(db -> db.setString(1, input.getStdNumber()))
                .map(db -> User.builder()
                        .stdNumber(db.getString("stdNumber"))
                        .name(db.getString("name"))
                        .email(db.getString("email"))
                        .password(db.getString("password"))
                        .build())
                .get(User.class);
    }

    @Override public List<User> selectAll() {
        return SQL("select * from mingus.member")
                .map(db -> {
                    List<User> list = new ArrayList<>();
                    while (db.next()) {
                        User user = User.builder()
                                .stdNumber(db.getString("stdNumber"))
                                .name(db.getString("name"))
                                .email(db.getString("email"))
                                .password(db.getString("password"))
                                .build();
                        list.add(user);
                    }
                    return list;
                })
                .get(List.class);
    }

    public boolean insert(User input) {
        return SQL("insert into mingus.member values (?,?,?,?)")
                .param(db -> db.setString(1, input.getStdNumber()))
                .param(db -> db.setString(2, input.getName()))
                .param(db -> db.setString(3, input.getEmail()))
                .param(db -> db.setString(4, input.getPassword()))
                .set();
    }

    public boolean update(User input, final String property, final String value) {
        return SQL("update  mingus.member set " + property + " = ?" + "where stdNumber = ?")
                .param(db -> db.setString(1, value))
                .param(db -> db.setString(2, input.getStdNumber()))
                .set();
    }

    public boolean delete(User input) {
        return SQL("delete from mingus.member where + ?")
                .param(db -> db.setString(1, input.getStdNumber()))
                .set();
    }
}