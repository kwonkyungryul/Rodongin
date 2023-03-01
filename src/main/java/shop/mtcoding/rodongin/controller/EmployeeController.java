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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import shop.mtcoding.rodongin.dto.ResponseDto;
import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeJoinReqDto;
import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeLoginReqDto;
import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeUpdatdReq;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.employee.Employee;
import shop.mtcoding.rodongin.model.employee.EmployeeCareer;
import shop.mtcoding.rodongin.model.employee.EmployeeGraduate;
import shop.mtcoding.rodongin.model.employee.EmployeeLicense;
import shop.mtcoding.rodongin.model.employee.EmployeeRepository;
import shop.mtcoding.rodongin.model.employee.EmployeeStack;
import shop.mtcoding.rodongin.model.master.LicenseMaster;
import shop.mtcoding.rodongin.model.master.LicenseMasterRepository;
import shop.mtcoding.rodongin.model.master.SchoolMaster;
import shop.mtcoding.rodongin.model.master.SchoolMasterRepository;
import shop.mtcoding.rodongin.model.master.StackMaster;
import shop.mtcoding.rodongin.model.master.StackMasterRepository;
import shop.mtcoding.rodongin.service.employee.EmployeeService;
import shop.mtcoding.rodongin.util.MySession;

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

    @PostMapping("/employee/{id}/save")
    public String save(@PathVariable int id, EmployeeGraduate employeeGraduate, EmployeeCareer employeeCareer,
            EmployeeLicense employeeLicense, EmployeeStack employeeStack) {

        Employee principal = MySession.MyPrincipal(session);

        if (principal == null) {
            throw new CustomException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        
        employeeService.개인정보추가(employeeGraduate, employeeCareer, employeeLicense, employeeStack, principal.getId());
        if (employeeCareer.getCareerStart().toString().equals("0001-01-01")) {
            employeeCareer.setCareerStart(null);
        }
        if (employeeCareer.getCareerEnd().toString().equals("0001-01-01")) {
            employeeCareer.setCareerEnd(null);
        }

        return "redirect:/employee/" + id;
    }

    @PutMapping("/employee/{id}")
    public ResponseEntity<?> update(@PathVariable int id, @RequestBody EmployeeUpdatdReq employeeUpdateReq) {

        Employee principal = MySession.MyPrincipal(session);

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
    public String infoUpdateForm(Model model) {
        Employee principal = MySession.MyPrincipal(session);

        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        
        List<SchoolMaster> schools = schoolMasterRepository.findAll();
        List<LicenseMaster> licenses = licenseMasterRepository.findAll();
        List<StackMaster> stacks = stackMasterRepository.findAll();
        model.addAttribute("empInfo", employeeRepository.findById(principal.getId()));
        model.addAttribute("schools", schools);
        model.addAttribute("licenses", licenses);
        model.addAttribute("stacks", stacks);

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
