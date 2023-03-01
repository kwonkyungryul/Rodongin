package shop.mtcoding.rodongin.model.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResumeRepository {

    public List<Resume> findByEmpId(int employeeId);

    public Resume findById(int Id);

    public int deleteById(int id);
 
}
