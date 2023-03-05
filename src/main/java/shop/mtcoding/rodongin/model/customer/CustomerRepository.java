package shop.mtcoding.rodongin.model.customer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CustomerRepository {

    public List<Customer> findAll();

    public Customer findById(int id);

    public int insert(@Param("customerTitle") String customerTitle, @Param("customerContent") String customerContent,
            @Param("employeeId") Integer employeeId);

    public int updateById(@Param("customerTitle") String customerTitle,
            @Param("customerContent") String customerContent,
            @Param("employeeId") Integer employeeId);

    public int deleteById(int id);
}
