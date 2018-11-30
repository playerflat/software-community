package site.namsu.sweng.core.entity;

import lombok.*;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

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
    private List<String> groupMember = new ArrayList<>();

    public boolean addMember(String stdNumber) {
        if (!searchMember(stdNumber)) {
            return groupMember.add(stdNumber);
        } else return false;
    }

    public boolean deleteMemeber(String stdNumber) {
        if (searchMember(stdNumber)) {
            return groupMember.remove(stdNumber);
        } else return false;
    }

    public void clearGroup() {
        if (groupMember == null) groupMember = new ArrayList<>();
        groupMember.clear();
    }

    public boolean searchMember(String stdNumber) {
        if (groupMember == null) groupMember = new ArrayList<>();
        return groupMember.contains(stdNumber);
    }
}
