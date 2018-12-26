package site.namsu.sweng.core.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder @Data
@AllArgsConstructor
@NoArgsConstructor
public class Group {
    private int groupNumber;
    private String name;
}
