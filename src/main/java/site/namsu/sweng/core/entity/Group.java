package site.namsu.sweng.core.entity;

import lombok.*;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-29 오후 1:12
 * @Homepage : https://github.com/gusdnd852
 */
@Data @Builder
@AllArgsConstructor
@NoArgsConstructor
public class Group implements Serializable {

    private @NonNull int groupNumber; // <-- 기본키
    private String groupName;
    private ArrayList<String> groupMembers = new ArrayList<>();
    private ArrayList<Message> messages = new ArrayList<>();


    public boolean addMember(String stdNumber) {
        if (!searchMember(stdNumber)) {
            return groupMembers.add(stdNumber);
        } else return false;
    }

    public boolean deleteMemeber(String stdNumber) {
        if (searchMember(stdNumber)) {
            return groupMembers.remove(stdNumber);
        } else return false;
    }

    public void clearGroup() {
        if (groupMembers == null) groupMembers = new ArrayList<>();
        groupMembers.clear();
    }

    public boolean searchMember(String stdNumber) {
        if (groupMembers == null) groupMembers = new ArrayList<>();
        return groupMembers.contains(stdNumber);
    }
}
