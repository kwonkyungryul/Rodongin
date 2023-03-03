package shop.mtcoding.rodongin.model.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResumeGraduateRepository {
    public int insert(ResumeGraduate apply);

    public List<ResumeGraduate> findAll();

    public ResumeGraduate findById(int id);

    public int updateById(int id, ResumeGraduate apply);

    public int deleteById(int id);

    public List<ResumeGraduate> findByResumeId(Integer resumeId);
}
