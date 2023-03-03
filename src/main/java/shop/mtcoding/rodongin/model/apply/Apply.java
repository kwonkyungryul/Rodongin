package shop.mtcoding.rodongin.model.apply;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class Apply {
    private Integer id;
    private Integer employeeId;
    private Integer companyId;
    private Timestamp createdAt;
    
    public Apply(Integer employeeId, Integer companyId) {
        this.employeeId = employeeId;
        this.companyId = companyId;
    }
}
