package shop.mtcoding.rodongin.model.customer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CustomerRepository {

    public List<Customer> findAll();

    public Customer findById(int id);

    public int insert(@Param("title") String title, @Param("content") String content,
            @Param("employeeId") Integer employeeId, @Param("employeeTel") String employeeTel,
            @Param("employeeEmail") String employeeEmail);

    public int updateById(@Param("title") String title, @Param("content") String content,
            @Param("employeeId") Integer employeeId, @Param("employeeTel") String employeeTel,
            @Param("employeeEmail") String employeeEmail);

    public int deleteById(int id);
}
