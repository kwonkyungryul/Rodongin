package shop.mtcoding.rodongin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeUpdatdReq;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.model.employee.EmployeeRepository;
import shop.mtcoding.rodongin.util.HtmlParser;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    public void 회원정보수정(EmployeeUpdatdReq employeeUpdatdReq, int principalId) {
        String thumbnail = HtmlParser.getThumbnail(employeeUpdatdReq.getEmployeeInfoThumbnail());

        try {
            employeeRepository.updateById(principalId, employeeUpdatdReq, thumbnail);

        } catch (Exception e) {
            throw new CustomApiException("회원정보 수정에 실패하였습니다", HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
