package shop.mtcoding.rodongin.model.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeGraduateRespDto;

@Mapper
public interface ResumeGraduateRepository {

    public int insert();

    public List<ResumeGraduateRespDto> findByResumeId(int resumeId);
    // public GraduateResp findById(int employeeId);
}
