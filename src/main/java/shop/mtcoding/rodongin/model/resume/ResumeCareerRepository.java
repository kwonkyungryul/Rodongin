package shop.mtcoding.rodongin.model.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeCareerSaveDto;

@Mapper
public interface ResumeCareerRepository {

    public List<ResumeCareer> findByResumeId(int resumeId);

    public void insert(@Param("resumeId") int resumeId,
            @Param("resumeCareerSaveDto") ResumeCareerSaveDto resumeCareerSaveDto);
}
