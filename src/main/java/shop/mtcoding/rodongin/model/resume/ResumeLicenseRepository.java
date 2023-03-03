package shop.mtcoding.rodongin.model.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeLicenseRespDto;

@Mapper
public interface ResumeLicenseRepository {

    List<ResumeLicenseRespDto> findByResumeId(int resumeId);

}
