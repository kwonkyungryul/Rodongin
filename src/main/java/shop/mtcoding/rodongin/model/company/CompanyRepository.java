package shop.mtcoding.rodongin.model.company;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.rodongin.dto.company.CompanyReq.CompanyLoginReqDto;

@Mapper
public interface CompanyRepository {

    public Company findByCompanyNameAndPassword(CompanyLoginReqDto companyLoginReqDto);

    public List<Company> findAll();

    public Company findById(int id);

    // public int insert(CompanyJoinReqDto companyJoinReqDto);

    public int updateById(@Param("id") Integer id, @Param("companyUsername") String companyUsername,
            @Param("companyPassword") String companyPassword, @Param("employeeFullname") String companyFullname,
            @Param("companyCeoName") String companyCeoName, @Param("companyLicenseNumber") String companyLicenseNumber,
            @Param("companyTel") String companyTel, @Param("companyAddress") Date companyAddress,
            @Param("companyEmail") String companyEmail, @Param("companyThumbnail") String companyThumbnail,
            @Param("companyEstablish") Date companyEstablish, @Param("companySales") Long companySales,
            @Param("companyEmployeesNumber") Integer companyEmployeesNumber,
            @Param("companyIntroduction") String companyIntroduction,
            @Param("companyHistory") String companyHistory, @Param("companyVision") String companyVision,
            @Param("createdAt") Timestamp createdAt);

    public int deleteById(int id);

}
