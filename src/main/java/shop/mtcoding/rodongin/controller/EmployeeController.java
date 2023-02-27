package shop.mtcoding.rodongin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import shop.mtcoding.rodongin.dto.ResponseDto;
import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeUpdatdReq;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.model.employee.Employee;
import shop.mtcoding.rodongin.model.employee.EmployeeRepository;
import shop.mtcoding.rodongin.model.master.LicenseMaster;
import shop.mtcoding.rodongin.model.master.LicenseMasterRepository;
import shop.mtcoding.rodongin.model.master.SchoolMaster;
import shop.mtcoding.rodongin.model.master.SchoolMasterRepository;
import shop.mtcoding.rodongin.model.master.StackMaster;
import shop.mtcoding.rodongin.model.master.StackMasterRepository;
import shop.mtcoding.rodongin.service.EmployeeService;

@Controller
public class EmployeeController {
    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private SchoolMasterRepository schoolMasterRepository;

    @Autowired
    private LicenseMasterRepository licenseMasterRepository;

    @Autowired
    private StackMasterRepository stackMasterRepository;

    @Autowired
    HttpSession session;

    @PutMapping("/employee/{id}")
    public ResponseEntity<?> update(@PathVariable int id, @RequestBody EmployeeUpdatdReq employeeUpdateReq) {

        Employee emp = new Employee();
        emp.setId(1);
        emp.setEmployeeName("ssar");
        emp.setEmployeePassword("1234");
        session.setAttribute("principal", emp);

        Employee principal = (Employee) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        if (employeeUpdateReq.getEmployeePassword() == null ||
                employeeUpdateReq.getEmployeePassword().isEmpty()) {
            throw new CustomApiException("Password을 작성해주세요");
        }
        if (employeeUpdateReq.getEmployeeEmail() == null ||
                employeeUpdateReq.getEmployeeEmail().isEmpty()) {
            throw new CustomApiException("Email을 작성해주세요");
        }
        if (employeeUpdateReq.getEmployeeBirth() == null) {
            throw new CustomApiException("Birth을 작성해주세요");
        }
        if (employeeUpdateReq.getEmployeeTel() == null ||
                employeeUpdateReq.getEmployeeTel().isEmpty()) {
            throw new CustomApiException("Tel을 작성해주세요");
        }
        if (employeeUpdateReq.getEmployeeAddress() == null ||
                employeeUpdateReq.getEmployeeAddress().isEmpty()) {
            throw new CustomApiException("Address을 작성해주세요");
        }

        employeeService.회원정보수정(employeeUpdateReq, principal.getId());

        return new ResponseEntity<>(new ResponseDto<>(1, "회원정보 수정 완료!", null), HttpStatus.OK);
    }

    @GetMapping("/employee/{id}")
    public String detail(Model model) {
        return "employee/detail";
    }

    @GetMapping("/employee/{id}/updateForm")
    public String infoUpdateForm(@PathVariable int id, Model model) {
        List<SchoolMaster> schools = schoolMasterRepository.findAll();
        List<LicenseMaster> licenses = licenseMasterRepository.findAll();
        List<StackMaster> stacks = stackMasterRepository.findAll();
        model.addAttribute("empInfo", employeeRepository.findById(id));
        model.addAttribute("schools", schools);
        model.addAttribute("licenses", licenses);
        model.addAttribute("stacks", stacks);

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
