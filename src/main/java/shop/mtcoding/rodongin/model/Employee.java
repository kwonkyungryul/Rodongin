package shop.mtcoding.rodongin.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Employee {
    private int id;
    private String employeeName;
    private String employeePassword;
    private String employeeFullname;
    private String employeeEmail;
    private String employeeTel;
    private String employeeGender;
    private Date employeeBirth;
    private String employeeAddress;
    private String employeeInfoThumbnail;
    private Timestamp createdAt;
}
