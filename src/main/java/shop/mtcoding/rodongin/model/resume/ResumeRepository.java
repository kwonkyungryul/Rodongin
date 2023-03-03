package shop.mtcoding.rodongin.model.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeListRespDto;


@Mapper
public interface ResumeRepository {

    public List<ResumeListRespDto> findByEmpId(int employeeId);

    public Resume findById(int id);

    public List<Resume> findByEmployeeId(int employeeId);

    public int deleteById(int id);

}
