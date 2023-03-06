package shop.mtcoding.rodongin.model.subscribe;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class Subscribe {
    private Integer id;
    private Integer employeeId;
    private Integer companyId;
    private Timestamp createdAt;
}