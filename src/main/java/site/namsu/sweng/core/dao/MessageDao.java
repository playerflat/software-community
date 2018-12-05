package site.namsu.sweng.core.dao;


import site.namsu.sweng.base.Accessor;
import site.namsu.sweng.base.Dao;
import site.namsu.sweng.core.entity.Message;
import site.namsu.sweng.util.Serializer;

import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("unchecked")
public class MessageDao extends Accessor implements Dao<Message>{

    @Override
    public Message select(Message input){
        return SQL("select * form mingus.message where messageNumber = ? ")
                .param(db -> db.setInt(1, input.getMessageNumber()))
                .map(db -> Message.builder()
                        .messageNumber(db.getInt("messageNumber"))
                        .groupName(db.getString("groupName"))
                        .name(db.getString("name"))
                        .contents(db.getString("contents"))
                        .time(db.getString("time"))
                        .build())
                .getOnce(Message.class);
    }

    @Override
    public List<Message> selectAll() {
        return SQL("select * form mingus.message")
                .map(db -> Message.builder()
                        .messageNumber(db.getInt("messageNumber"))
                        .groupName(db.getString("groupName"))
                        .name(db.getString("name"))
                        .contents(db.getString("contents"))
                        .time(db.getString("time"))
                        .build())
                .getList(Message.class);
    }

    @Override
    public boolean insert(Message input) {
        return SQL("insert into mingus.board values (?,?,?,?,?")
                .param(db -> db.setInt(1, input.getMessageNumber()))
                .param(db -> db.setString(2, input.getGroupName()))
                .param(db -> db.setString(3, input.getName()))
                .param(db -> db.setString(4, input.getContents()))
                .param(db -> db.setString(5, input.getTime()))
                .set();
    }

    @Override
    public boolean update(Message input, String property, String value) {
        return SQL("update mingus.message set " + property + " = ?" + "where  messageNumber = ?")
                .param(db -> db.setString(1, value))
                .param(db -> db.setInt(2, input.getMessageNumber()))
                .set();
    }

    @Override
    public boolean delete(Message input) {
        return false;
    }

}
