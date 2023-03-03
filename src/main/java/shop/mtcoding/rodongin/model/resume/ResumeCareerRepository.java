package shop.mtcoding.rodongin.model.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResumeCareerRepository {
    public int insert(ResumeCareer apply);

    public List<ResumeCareer> findAll();

    public ResumeCareer findById(int id);

    public int updateById(int id, ResumeCareer apply);

    public int deleteById(int id);
}
