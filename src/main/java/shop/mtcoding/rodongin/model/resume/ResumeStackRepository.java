package shop.mtcoding.rodongin.model.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeStackRespDto;

@Mapper
public interface ResumeStackRepository {

    List<ResumeStackRespDto> findByResumeId(int resumeId);

}
