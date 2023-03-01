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

import shop.mtcoding.rodongin.dto.EmployeeReq.EmployeeLoginReqDto;
import shop.mtcoding.rodongin.dto.ResponseDto;
import shop.mtcoding.rodongin.dto.employee.EmployeeReq.EmployeeUpdatdReq;
import shop.mtcoding.rodongin.dto.employee.EmployeeResp.GraduateRespDto;
import shop.mtcoding.rodongin.dto.employee.EmployeeResp.LicenseRespDto;
import shop.mtcoding.rodongin.dto.employee.EmployeeResp.StackRespDto;
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
import shop.mtcoding.rodongin.model.master.LicenseMaster;
import shop.mtcoding.rodongin.model.master.LicenseMasterRepository;
import shop.mtcoding.rodongin.model.master.SchoolMaster;
import shop.mtcoding.rodongin.model.master.SchoolMasterRepository;
import shop.mtcoding.rodongin.model.master.StackMaster;
import shop.mtcoding.rodongin.model.master.StackMasterRepository;
import shop.mtcoding.rodongin.model.resume.Resume;
import shop.mtcoding.rodongin.model.resume.ResumeRepository;
import shop.mtcoding.rodongin.service.EmployeeService;
import shop.mtcoding.rodongin.util.MySession;

@Controller
public class EmployeeController {
    @Autowired
    private EmployeeRepository emploRepository;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private SchoolMasterRepository schoolMasterRepository;

    @Autowired
    private LicenseMasterRepository licenseMasterRepository;

    @Autowired
    private StackMasterRepository stackMasterRepository;

    @Autowired
    private HttpSession session;

    @Autowired
    private EmployeeCareerRepository employeeCareerrRepository;

    @Autowired
    private EmployeeGraduateRepository employeeGraduateRepository;

    @Autowired
    private EmployeeLicenseRepository employeeLicenseRepository;

    @Autowired
    private EmployeeStackRepository employeeStackRepository;

    @Autowired
    private ResumeRepository resumeRepository;



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

  
    @PostMapping("/employee/joinForm")
    public String join() {
        return "employee/joinForm";

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

        Employee principal = emploRepository.findByEmployeeNameAndPassword(employeeLoginReqDto);

        if (principal == null) {
            throw new CustomException("아이디 혹은 비번이 틀렸습니다", HttpStatus.BAD_REQUEST);
        }

        session.setAttribute("principal", principal);

        return "redirect:/";
    }

    @GetMapping("/employee/{id}")
    public String detail(Model model) {

        Employee principal = MySession.MyPrincipal(session);

        model.addAttribute("empInfo", emploRepository.findById(principal.getId()));

        List<EmployeeCareer> empCareers = employeeCareerrRepository.findById(principal.getId());
        model.addAttribute("empCareer", empCareers);

        List<GraduateRespDto> empGraduates = employeeGraduateRepository.findById(principal.getId());
        model.addAttribute("empGraduates", empGraduates);

        List<LicenseRespDto> empLicense = employeeLicenseRepository.findById(principal.getId());
        model.addAttribute("empLicense", empLicense);

        List<StackRespDto> empStack = employeeStackRepository.findById(principal.getId());
        model.addAttribute("empStack", empStack);

        List<Resume> resumes = resumeRepository.findByEmpId(principal.getId());
        model.addAttribute("resumes", resumes);

    
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
        model.addAttribute("empInfo", emploRepository.findById(principal.getId()));
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
