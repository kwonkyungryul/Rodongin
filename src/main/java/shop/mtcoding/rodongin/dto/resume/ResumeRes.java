package shop.mtcoding.rodongin.dto.resume;

import lombok.Getter;
import lombok.Setter;

public class ResumeRes {
    
    @Setter
    @Getter
    public static class ResumeApplyListResDto {
        private String resumeTitle;
        private String resumeSalary;
        private String careerCompany;
    }
}
