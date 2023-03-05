package shop.mtcoding.rodongin.dto.customer;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

public class CustomerResp {

    @Setter
    @Getter
    public static class CustomerListRespDto {
        private Integer id;
        private String customerTitle;
        private String employeeName;
        private Timestamp createdAt;
    }

    @Setter
    @Getter
    public static class CustomerDetailRespDto {
        private Integer id;
        private String customerTitle;
        private String customerContent;
        private Integer employeeId;
        private String employeeName;
    }
}
