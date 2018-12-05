package site.namsu.sweng.core.entity;

import lombok.*;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오후 2:33
 * @Homepage : https://github.com/gusdnd852
 */

@Builder @Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
     private int boardNumber;
     private String stdNumber;
     private String name;
     private String title;
     private String contents;
     private String date;
}
