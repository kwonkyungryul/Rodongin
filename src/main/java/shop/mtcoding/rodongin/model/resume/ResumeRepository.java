package shop.mtcoding.rodongin.model.resume;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeGraduteRespDto;



@Mapper
public interface ResumeRepository {

    public List<ResumeGraduteRespDto> findByEmpId(int employeeId);

    public Resume findById(int id);

    public int deleteById(int id);

    // public List<ResumeGraduteRespDto> findGraduteByEmpId(int employeeId);
 
}
