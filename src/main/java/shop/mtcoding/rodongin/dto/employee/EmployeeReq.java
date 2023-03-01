package shop.mtcoding.rodongin.dto.employee;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

public class EmployeeReq {

    @Getter
    @Setter
    public static class EmployeeUpdatdReq {
        private String employeePassword;
        private String employeeEmail;
        private Date employeeBirth;
        private String employeeTel;
        private String employeeAddress;
        private String employeeInfoThumbnail;
    }
}
