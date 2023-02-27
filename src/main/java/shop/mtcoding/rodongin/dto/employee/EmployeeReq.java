package shop.mtcoding.rodongin.dto.employee;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

public class EmployeeReq {

    @Setter
    @Getter
    public static class EmployeeLoginReqDto {

        private String employeeName;
        private String employeePassword;
        private String employeeEmail;
        private String employeeFullname;
        private Date employeeBirth;
        private String employeeTel;
        private String employeeGender;
        private String employeeAddress;

    }
}
