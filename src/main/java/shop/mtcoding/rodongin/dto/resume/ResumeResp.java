package shop.mtcoding.rodongin.dto.resume;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

public class ResumeResp {

    @Getter
    @Setter
    public static class ResumeGraduteRespDto {
        private Integer id;
        private Integer employeeId;
        private String resumeTitle;
        private String resumeSalary;
        private Integer resumeId;
        private Integer schoolId;
        private String schoolGradute;
        private String schoolName;
        private String careerCompany;
        private Date careerStart;
        private Date careerEnd;
        private String licenseName;
        private String licenseIssuer;
        private String stackName;
        private String stackAcquisition;
    }

}
