package shop.mtcoding.rodongin.service.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeJoinReqDto;
import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeLoginReqDto;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.employee.Employee;
import shop.mtcoding.rodongin.model.employee.EmployeeRepository;
import shop.mtcoding.rodongin.util.Encode;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    @Transactional
    public void 회원가입(EmployeeJoinReqDto employeeJoinReqDto) {
        Employee sameEmployee = employeeRepository.findByEmployeeName(employeeJoinReqDto.getEmployeeName());

        // if (sameEmployee != null) {
        // throw new CustomException("동일한 아이디가 존재합니다");
        // }
        // int result = employeeRepository.insert(employeeJoinReqDto);

        // if (result != 1) {
        // throw new CustomException("회원가입실패");
        // }

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

        try {
            employeeRepository.insert(new EmployeeJoinReqDto());
        } catch (Exception e) {
            throw new CustomException("일시적인 서버 에러입니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Transactional
    public Employee 로그인(EmployeeLoginReqDto employeeLoginReqDto) {
        Employee principal = employeeRepository.findByEmployeeNameAndPassword(employeeLoginReqDto);

        if (principal == null) {
            throw new CustomException("일치하는 회원정보가 없습니다.");
        }
        return principal;

    }
}
