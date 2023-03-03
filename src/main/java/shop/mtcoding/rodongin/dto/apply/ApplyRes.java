package shop.mtcoding.rodongin.dto.apply;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

public class ApplyRes {
    
    @Setter
    @Getter
    public static class ApplyListResDto {
        private String employeeFullname;
        private String employeeAddress;
        private String resumeTitle;
        private String resumeSalary;
        private String stackName;
        private String companyName;
        private Integer resumeId;
    }

    @Setter
    @Getter
    public static class ApplyListResumeResDto {
        private String employeeFullname;
        private String employeeAddress;
        private List<String> careerCompany;
        private String resumeTitle;
        private String career;
        private String stack;
        private Integer resumeId;

    }
}
