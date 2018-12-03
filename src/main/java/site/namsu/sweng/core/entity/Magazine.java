package site.namsu.sweng.core.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Magazine {
    private int magazineNumber;
    private String title;
    private String name;
    private String text;
    private String date;
}
