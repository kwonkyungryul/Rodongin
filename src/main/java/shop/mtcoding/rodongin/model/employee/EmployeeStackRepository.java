package shop.mtcoding.rodongin.model.employee;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface EmployeeStackRepository {
    public int insert(@Param("employeeStack") EmployeeStack employeeStack,
            @Param("employeeId") int employeeId);
}
