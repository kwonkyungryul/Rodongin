package shop.mtcoding.rodongin.model.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeGraduateSaveDto;
import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeGraduateRespDto;

@Mapper
public interface ResumeGraduateRepository {

    public int insert(@Param("resumeId") int resumeId,
            @Param("resumeGraduateSaveDto") ResumeGraduateSaveDto resumeGraduateSaveDto);

    public List<ResumeGraduateRespDto> findByResumeId(int resumeId);
    // public GraduateResp findById(int employeeId);
}
