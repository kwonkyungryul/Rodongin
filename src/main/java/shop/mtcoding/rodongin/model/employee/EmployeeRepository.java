package shop.mtcoding.rodongin.model.employee;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeUpdatdReq;

@Mapper
public interface EmployeeRepository {

    public List<Employee> findAll();

    public Employee findById(int id);

    public int insert();

    public int updateById(@Param("id") int id, @Param("employeeUpdatdReq") EmployeeUpdatdReq employeeUpdatdReq);

    public int deleteById(int id);
}
