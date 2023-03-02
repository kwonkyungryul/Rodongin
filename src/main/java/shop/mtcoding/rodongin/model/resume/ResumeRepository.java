package shop.mtcoding.rodongin.model.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResumeRepository {

    public Resume findById(int id);

    public List<Resume> findByEmployeeId(int employeeId);

}
