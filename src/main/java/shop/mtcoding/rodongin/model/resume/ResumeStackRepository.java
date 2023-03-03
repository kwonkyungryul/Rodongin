package shop.mtcoding.rodongin.model.resume;

import java.util.List;

import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeStackRespDto;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResumeStackRepository {

    List<ResumeStackRespDto> findByResumeId(int resumeId);

}
