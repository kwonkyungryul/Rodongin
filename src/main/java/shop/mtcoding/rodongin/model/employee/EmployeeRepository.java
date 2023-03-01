package shop.mtcoding.rodongin.model.employee;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeUpdatdReq;
import shop.mtcoding.rodongin.dto.EmployeeReq.EmployeeLoginReqDto;


@Mapper
public interface EmployeeRepository {

    public Employee findByEmployeeNameAndPassword(EmployeeLoginReqDto employeeLoginReqDto);
    
    public List<Employee> findAll();

    public Employee findById(int id);

    public int updateById(@Param("id") int id, @Param("employeeUpdatdReq") EmployeeUpdatdReq employeeUpdatdReq);

    public int insert(EmployeeLoginReqDto employeeLoginReqDto);

    public int deleteById(int id);
}
