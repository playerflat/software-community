package site.namsu.sweng.core.entity;

import lombok.*;

import java.io.Serializable;
import java.util.List;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-25 오전 3:15
 * @Homepage : https://github.com/gusdnd852
 */
@Builder @Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
     private String stdNumber;
     private String password;
     private String name;
     private String email;
     private boolean admin = false;
}
