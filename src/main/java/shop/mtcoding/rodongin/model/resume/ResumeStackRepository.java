package shop.mtcoding.rodongin.model.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeStackSaveDto;
import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeStackRespDto;

@Mapper
public interface ResumeStackRepository {

    List<ResumeStackRespDto> findByResumeId(int resumeId);

    void insert(@Param("resumeId") int resumeId, @Param("resumeStackSaveDto") ResumeStackSaveDto resumeStackSaveDto);

}
