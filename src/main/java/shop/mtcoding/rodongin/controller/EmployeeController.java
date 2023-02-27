package shop.mtcoding.rodongin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import shop.mtcoding.rodongin.dto.EmployeeReq.EmployeeLoginReqDto;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.employee.Employee;
import shop.mtcoding.rodongin.model.employee.EmployeeRepository;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private HttpSession session;

    // employee 로그인요청
    @PostMapping("/login")
    public String login(EmployeeLoginReqDto employeeLoginReqDto) {
        if (employeeLoginReqDto.getEmployeeName() == null || employeeLoginReqDto.getEmployeeName().isEmpty()) {
            throw new CustomException("username을 입력해주세요", HttpStatus.BAD_REQUEST);
        }
        if (employeeLoginReqDto.getEmployeePassword() == null || employeeLoginReqDto.getEmployeePassword().isEmpty()) {
            throw new CustomException("password를 입력해주세요", HttpStatus.BAD_REQUEST);
        }

        Employee principal = employeeRepository.findByEmployeeNameAndPassword(employeeLoginReqDto);

        if (principal == null) {
            throw new CustomException("아이디 혹은 비번이 틀렸습니다", HttpStatus.BAD_REQUEST);
        }

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

    @GetMapping("/login")
    public String login() {
        return "loginForm";
    }

    @GetMapping("/employee/joinForm")
    public String employeejoin() {
        return "employee/joinForm";
    }
}
