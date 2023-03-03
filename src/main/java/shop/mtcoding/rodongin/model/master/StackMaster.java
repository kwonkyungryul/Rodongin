package shop.mtcoding.rodongin.model.master;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class StackMaster {
    private Integer id;
    private String stackName;
    private Timestamp createdAt;
}
