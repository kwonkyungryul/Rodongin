package shop.mtcoding.rodongin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeJoinReqDto;
import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeLoginReqDto;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.employee.Employee;
import shop.mtcoding.rodongin.model.employee.EmployeeRepository;
import shop.mtcoding.rodongin.service.employee.EmployeeService;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private HttpSession session;

    @PostMapping("/employee/join")
    public String join(EmployeeJoinReqDto employeeJoinReqDto) throws Exception {

        if (employeeJoinReqDto.getEmployeeName() == null || employeeJoinReqDto.getEmployeeName().isEmpty()) {
            throw new CustomException("아이디를 작성해주세요");
        }
        if (employeeJoinReqDto.getEmployeePassword() == null || employeeJoinReqDto.getEmployeePassword().isEmpty()) {
            throw new CustomException("비밀번호를 작성해주세요");
        }
        if (employeeJoinReqDto.getEmployeeEmail() == null || employeeJoinReqDto.getEmployeeEmail().isEmpty()) {
            throw new CustomException("email을 작성해주세요");
        }
        if (employeeJoinReqDto.getEmployeeFullname() == null || employeeJoinReqDto.getEmployeeFullname().isEmpty()) {
            throw new CustomException("성함을 작성해주세요");
        }
        if (employeeJoinReqDto.getEmployeeBirth() == null) {
            throw new CustomException("생일을 작성해주세요");
        }
        if (employeeJoinReqDto.getEmployeeTel() == null || employeeJoinReqDto.getEmployeeTel().isEmpty()) {
            throw new CustomException("연락처를 작성해주세요");
        }
        if (employeeJoinReqDto.getEmployeeGender() == null) {
            throw new CustomException("성별을 선택해주세요");
        }
        if (employeeJoinReqDto.getEmployeeAddress() == null || employeeJoinReqDto.getEmployeeAddress().isEmpty()) {
            throw new CustomException("주소를 작성해주세요");
        }

        String email = employeeJoinReqDto.getEmployeeEmail().replaceAll(",", "");
        // System.out.println(email);
        employeeJoinReqDto.setEmployeeEmail(email);

        String tel = employeeJoinReqDto.getEmployeeTel().replaceAll(",", "");
        employeeJoinReqDto.setEmployeeTel(tel);

        String address = employeeJoinReqDto.getEmployeeAddress().replaceAll(",", "");
        employeeJoinReqDto.setEmployeeAddress(address);

        employeeService.회원가입(employeeJoinReqDto);
        return "redirect:/loginForm";
    }

    // employee 로그인요청
    @PostMapping("/employee/login")
    public String login(EmployeeLoginReqDto employeeLoginReqDto) {
        if (employeeLoginReqDto.getEmployeeName() == null || employeeLoginReqDto.getEmployeeName().isEmpty()) {
            throw new CustomException("username을 입력해주세요", HttpStatus.BAD_REQUEST);
        }
        if (employeeLoginReqDto.getEmployeePassword() == null || employeeLoginReqDto.getEmployeePassword().isEmpty()) {
            throw new CustomException("password를 입력해주세요", HttpStatus.BAD_REQUEST);
        }

        // if (principal == null) {
        // throw new CustomException("아이디 혹은 비번이 틀렸습니다", HttpStatus.BAD_REQUEST);
        // }
        Employee principal = employeeService.로그인(employeeLoginReqDto);
        session.setAttribute("principal", principal);

        return "redirect:/";
    }

    @GetMapping("/employee/{id}")
    public String detail(Model model) {
        return "employee/detail";
    }

    @GetMapping("/employee/updateForm")
    public String infoUpdateForm() {
        return "employee/updateForm";
    }

    @GetMapping("/loginForm")
    public String loginForm() {
        return "loginForm";
    }

    @GetMapping("/employee/joinForm")
    public String employeejoin() {
        return "employee/joinForm";
    }
}
