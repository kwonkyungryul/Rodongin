package shop.mtcoding.rodongin.model.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeSaveDto;
import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeListRespDto;


@Mapper
public interface ResumeRepository {

    public List<ResumeListRespDto> findByEmpId(int employeeId);

    public Resume findById(int id);

    public List<Resume> findByEmployeeId(int employeeId);

    public int deleteById(int id);

    public int insert(@Param("employeeId") int employeeId, @Param("resumeSaveDto") ResumeSaveDto resumeSaveDto);
    // public int insert(@Param("employeeId") int employeeId, @Param("resumeTitle")String resumeTitle, @Param("resumeSalary")String resumeSalary, @Param("CV") String CV);

}
