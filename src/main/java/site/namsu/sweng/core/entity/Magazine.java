package site.namsu.sweng.core.entity;

import lombok.*;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Magazine {
     private int magazineNumber;
     private String stdNumber;
     private String name;
     private String title;
     private String contents;
     private String date;
}
