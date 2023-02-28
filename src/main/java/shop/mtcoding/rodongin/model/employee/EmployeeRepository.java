package shop.mtcoding.rodongin.model.employee;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeJoinReqDto;
import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeLoginReqDto;

@Mapper
public interface EmployeeRepository {
    public Employee findByEmployeeName(String employeeName);

    public Employee findByEmployeeNameAndPassword(EmployeeLoginReqDto employeeLoginReqDto);

    public List<Employee> findAll();

    public Employee findById(int id);

    public int insert(EmployeeJoinReqDto employeejoinReqDto);

    // public int insert(@Param("employeeName") String employeeName,
    // @Param("employeePassword") String employeePassword,
    // @Param("employeeFullname") String employeeFullname, @Param("employeeEmail")
    // String employeeEmail,
    // @Param("employeeTel") String employeeTel, @Param("employeeGender") String
    // employeeGender,
    // @Param("employeeBirth") Date employeeBirth, @Param("employeeAddress") String
    // employeeAddress,
    // @Param("employeeInfoThumbnail") String employeeInfoThumbnail,
    // @Param("createdAt") Timestamp createdAt);

    public int updateById(@Param("id") int id, @Param("employeeName") String employeeName,
            @Param("employeePassword") String employeePassword, @Param("employeeFullname") String employeeFullname,
            @Param("employeeEmail") String employeeEmail, @Param("employeeTel") String employeeTel,
            @Param("employeeGender") String employeeGender, @Param("employeeBirth") Date employeeBirth,
            @Param("employeeAddress") String employeeAddress,
            @Param("employeeInfoThumbnail") String employeeInfoThumbnail, @Param("createdAt") Timestamp createdAt);

    public int deleteById(int id);
}
