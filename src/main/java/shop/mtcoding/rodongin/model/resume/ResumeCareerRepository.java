package shop.mtcoding.rodongin.model.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResumeCareerRepository {

    public List<ResumeCareer> findByResumeId(int resumeId);
}
