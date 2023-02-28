package shop.mtcoding.rodongin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeUpdatdReq;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.employee.EmployeeCareer;
import shop.mtcoding.rodongin.model.employee.EmployeeCareerRepository;
import shop.mtcoding.rodongin.model.employee.EmployeeGraduate;
import shop.mtcoding.rodongin.model.employee.EmployeeGraduateRepository;
import shop.mtcoding.rodongin.model.employee.EmployeeLicense;
import shop.mtcoding.rodongin.model.employee.EmployeeLicenseRepository;
import shop.mtcoding.rodongin.model.employee.EmployeeRepository;
import shop.mtcoding.rodongin.model.employee.EmployeeStack;
import shop.mtcoding.rodongin.model.employee.EmployeeStackRepository;
import shop.mtcoding.rodongin.util.HtmlParser;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;
    @Autowired
    private EmployeeGraduateRepository employeeGraduateRepository;
    @Autowired
    private EmployeeCareerRepository employeeCareerRepository;
    @Autowired
    private EmployeeLicenseRepository employeeLicenseRepository;
    @Autowired
    private EmployeeStackRepository employeeStackRepository;

    @Transactional
    public void 회원정보수정(EmployeeUpdatdReq employeeUpdatdReq, int principalId) {
        String thumbnail = HtmlParser.getThumbnail(employeeUpdatdReq.getEmployeeInfoThumbnail());

        try {
            employeeRepository.updateById(principalId, employeeUpdatdReq, thumbnail);

        } catch (Exception e) {
            throw new CustomApiException("회원정보 수정에 실패하였습니다", HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    @Transactional
    public void 개인정보추가(EmployeeGraduate employeeGraduate, EmployeeCareer employeeCareer,
            EmployeeLicense employeeLicense, EmployeeStack employeeStack, int principalId) {

        int result = employeeGraduateRepository.insert(employeeGraduate, principalId);
        if (result != 1) {
            throw new CustomException("최종학력 추가 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        int result2 = employeeCareerRepository.insert(employeeCareer, principalId);
        if (result2 != 1) {
            throw new CustomException("경력 추가 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        int result3 = employeeLicenseRepository.insert(employeeLicense, principalId);
        if (result3 != 1) {
            throw new CustomException("자격증 추가 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        int result4 = employeeStackRepository.insert(employeeStack, principalId);
        if (result4 != 1) {
            throw new CustomException("기술스택 추가 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
