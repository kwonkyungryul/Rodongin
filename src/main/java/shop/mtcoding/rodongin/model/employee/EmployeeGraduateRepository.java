package shop.mtcoding.rodongin.model.employee;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface EmployeeGraduateRepository {

    public int insert(@Param("employeeGraduate") EmployeeGraduate employeeGraduate,
            @Param("employeeId") int employeeId);

}
