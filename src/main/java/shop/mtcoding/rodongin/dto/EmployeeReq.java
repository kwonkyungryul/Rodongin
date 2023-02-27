package shop.mtcoding.rodongin.dto;

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
