package site.namsu.sweng.core.entity;

import lombok.*;

@Builder @Data
@AllArgsConstructor
@NoArgsConstructor
public class Message {
    private @NonNull int messageNumber;
    private String stdNumber;
    private String contents;
    private String time;
}
