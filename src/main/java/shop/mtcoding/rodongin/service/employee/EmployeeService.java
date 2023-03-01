package shop.mtcoding.rodongin.service.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeJoinReqDto;
import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeLoginReqDto;
import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeUpdatdReq;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.employee.Employee;
import shop.mtcoding.rodongin.model.employee.EmployeeCareer;
import shop.mtcoding.rodongin.model.employee.EmployeeCareerRepository;
import shop.mtcoding.rodongin.model.employee.EmployeeGraduate;
import shop.mtcoding.rodongin.model.employee.EmployeeGraduateRepository;
import shop.mtcoding.rodongin.model.employee.EmployeeLicense;
import shop.mtcoding.rodongin.model.employee.EmployeeLicenseRepository;
import shop.mtcoding.rodongin.model.employee.EmployeeRepository;
import shop.mtcoding.rodongin.model.employee.EmployeeStack;
import shop.mtcoding.rodongin.model.employee.EmployeeStackRepository;
import shop.mtcoding.rodongin.util.Encode;

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
    public void 회원가입(EmployeeJoinReqDto employeeJoinReqDto) {

        Employee sameEmployee = employeeRepository.findByEmployeeName(employeeJoinReqDto.getEmployeeName());

        if (sameEmployee != null) {
            throw new CustomException("동일한 username이 존재합니다");
        }
        String encodedPassword = "";
        try {
            encodedPassword = Encode.passwordEncode(employeeJoinReqDto.getEmployeePassword());

        } catch (Exception e) {
            throw new CustomException("비밀번호 해싱 오류", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        employeeJoinReqDto.setEmployeePassword(encodedPassword);
        // System.out.println("테스트");

        employeeRepository.insert(employeeJoinReqDto);
        try {

        } catch (Exception e) {
            throw new CustomException("일시적인 서버 에러입니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    @Transactional
    public Employee 로그인(EmployeeLoginReqDto employeeLoginReqDto) {
        Employee principalPS = employeeRepository.findByEmployeeName(employeeLoginReqDto.getEmployeeName());

        boolean isCheck;
        try {
            isCheck = Encode.matches(employeeLoginReqDto.getEmployeePassword(), principalPS.getEmployeePassword());
        } catch (Exception e) {
            throw new CustomException("???");
        }

        if (!isCheck) {
            throw new CustomException("비밀번호가 다릅니다.");
        }
        employeeLoginReqDto.setEmployeePassword(principalPS.getEmployeePassword());

        Employee principal = employeeRepository.findByEmployeeNameAndPassword(employeeLoginReqDto);
        if (principal == null) {
            throw new CustomException("일치하는 회원정보가 없습니다.");
        }
        return principal;

    }

    @Transactional
    public void 회원정보수정(EmployeeUpdatdReq employeeUpdatdReq, int principalId) {
        // String thumbnail =
        // HtmlParser.getThumbnail(employeeUpdatdReq.getEmployeeInfoThumbnail());

        try {
            employeeRepository.updateById(principalId, employeeUpdatdReq);

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
