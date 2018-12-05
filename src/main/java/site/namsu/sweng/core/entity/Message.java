package site.namsu.sweng.core.entity;

import lombok.*;

@Builder @Data
@AllArgsConstructor
@NoArgsConstructor
public class Message {
     private int messageNumber;
     private String groupName;
     private String name;
     private String contents;
     private String time;
}
