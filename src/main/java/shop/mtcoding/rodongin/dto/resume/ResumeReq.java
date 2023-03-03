package shop.mtcoding.rodongin.dto.resume;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

public class ResumeReq {

    @Setter
    @Getter
    public static class ResumeSaveDto {
        private String id;
        private String resumeTitle;
        private String resumeSalary;
        private String CV;
    }

    @Getter
    @Setter
    public static class ResumeGraduateSaveDto {
        private String schoolName;
        private String schoolGraduate;
    }

    @Getter
    @Setter
    public static class ResumeCareerSaveDto {
        private String careerCompany;
        private Date careerStart;
        private Date careerEnd;
    }

    @Getter
    @Setter
    public static class ResumeLicenseSaveDto {
        private String licenseName;
        private String licenseIssuer;
    }

    @Getter
    @Setter
    public static class ResumeStackSaveDto {
        private String stackName;
        private String stackAcquistion;
    }

    
    
}
