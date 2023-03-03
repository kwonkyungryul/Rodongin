package shop.mtcoding.rodongin.model.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeGraduateRespDto;


@Mapper
public interface ResumeGraduateRepository {
    public int insert(ResumeGraduate resumeGraduate);

    public List<ResumeGraduate> findAll();

    public ResumeGraduate findById(int id);

    public int updateById(int id, ResumeGraduate apply);

    public int deleteById(int id);

    public List<ResumeGraduate> findByResumeId(Integer resumeId);
    
    public List<ResumeGraduateRespDto> findByResumeId(int resumeId);

    // public GraduateResp findById(int employeeId);

}
