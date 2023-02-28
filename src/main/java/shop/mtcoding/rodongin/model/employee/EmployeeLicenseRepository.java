package shop.mtcoding.rodongin.model.employee;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface EmployeeLicenseRepository {
    public int insert(@Param("employeeLicense") EmployeeLicense employeeLicense,
            @Param("employeeId") int employeeId);

}
