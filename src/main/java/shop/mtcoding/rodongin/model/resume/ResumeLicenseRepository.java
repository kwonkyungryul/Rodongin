package shop.mtcoding.rodongin.model.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeLicenseSaveDto;
import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeLicenseRespDto;

@Mapper
public interface ResumeLicenseRepository {

    List<ResumeLicenseRespDto> findByResumeId(int resumeId);

    void insert(@Param("resumeId") int resumeId,
            @Param("resumeLicenseSaveDto") ResumeLicenseSaveDto resumeLicenseSaveDto);

}
