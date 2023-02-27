package shop.mtcoding.rodongin.dto;

import lombok.Getter;
import lombok.Setter;

public class EmployeeReq {

    @Setter
    @Getter
    public static class EmployeeLoginReqDto {
        private String employeeName;
        private String employeePassword;
    }

}
