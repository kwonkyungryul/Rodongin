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
import org.springframework.web.bind.annotation.RequestBody;

import shop.mtcoding.rodongin.dto.ResponseDto;
import shop.mtcoding.rodongin.dto.apply.ApplyEmailReq;
import shop.mtcoding.rodongin.dto.apply.ApplyResp.ApplyListRespDto;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.apply.ApplyRepository;
import shop.mtcoding.rodongin.model.company.Company;
import shop.mtcoding.rodongin.model.company.CompanyRepository;
import shop.mtcoding.rodongin.model.employee.Employee;
import shop.mtcoding.rodongin.model.employee.EmployeeRepository;
import shop.mtcoding.rodongin.model.resume.Resume;
import shop.mtcoding.rodongin.model.resume.ResumeGraduateRepository;
import shop.mtcoding.rodongin.model.resume.ResumeRepository;
import shop.mtcoding.rodongin.service.apply.ApplyService;
import shop.mtcoding.rodongin.util.SendMail;

@Controller
public class ApplyController {
    // employeeFullname, employee_address, resume_title,
    @Autowired
    private ApplyRepository applyRepository;

    @Autowired
    private ResumeRepository resumeRepository;

    @Autowired
    private ResumeGraduateRepository resumeGraduateRepository;

    @Autowired
    private ApplyService applyService;

    @Autowired
    private HttpSession session;

    @Autowired
    private SendMail sm;

    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private CompanyRepository companyRepository;

    @GetMapping("/apply/{companyId}/list")
    public String applyList(@PathVariable int companyId, Model model) {
        Company principal = (Company) session.getAttribute("comPrincipal");
        if (principal == null) {
            throw new CustomException("인증되지 않았습니다.");
        }
        List<ApplyListRespDto> applys = applyRepository.findByCompanyId(companyId);

        model.addAttribute("applys", applys);

        return "apply/list";
    }

    @PostMapping("/apply")
    public String apply(int announcementId, int resumeId) {

        Employee principal = (Employee) session.getAttribute("principal");

        if (principal == null) {
            throw new CustomException("인증이 되지 않았습니다.", HttpStatus.UNAUTHORIZED);
        }
        applyService.지원하기(announcementId, resumeId);

        return "redirect:/announcement/" + announcementId;
    }

    @PostMapping("/apply/sendEmail")
    public ResponseEntity<?> sendEmail(@RequestBody ApplyEmailReq applyEmailReq) {
        // System.out.println(applyEmailReq.getEmployeeId());
        // System.out.println(applyEmailReq.getCompanyId());
        // System.out.println(applyEmailReq.getStatus());
        Employee employee = employeeRepository.findById(applyEmailReq.getEmployeeId());
        if (employee == null) {
            throw new CustomApiException("잘못된 접근입니다.");
        }
        
        Company company = companyRepository.findById(applyEmailReq.getCompanyId());
        if (company == null) {
            throw new CustomApiException("잘못된 접근입니다.");
        }

        String employeeName = employee.getEmployeeFullname();
        String companyName = company.getCompanyFullname();
        Integer status = applyEmailReq.getStatus();

        StringBuilder sb = new StringBuilder();

        if (status == 1) {
            sb.append("안녕하세요.");
            sb.append(employeeName);
            sb.append("님.\n저희 네이버에 지원해주셔서 감사합니다. 서류지원 합격여부 결과 안내드립니다.\n");
            sb.append(employeeName);
            sb.append("님 축하드립니다. ");
            sb.append(employeeName);
            sb.append("님은 서류지원에 합격하셨습니다.\n자세한 사항은 Rodongin 홈페이지를 참고해주세요.");
            sm.sendMail(employee.getEmployeeEmail(), company.getCompanyFullname() + " 입사지원 합격여부 메일입니다.", sb.toString());
        } else if (status == 0) {
            sb.append("안녕하세요.");
            sb.append(employeeName);
            sb.append("님.\n저희 네이버에 지원해주셔서 감사합니다. 서류지원 합격여부 결과 안내드립니다.\n");
            sb.append(employeeName);
            sb.append("님은 서류지원에 불합격하셨습니다. 귀하의 앞날을 응원합니다.\n자세한 사항은 Rodongin 홈페이지를 참고해주세요.");
            sm.sendMail(employee.getEmployeeEmail(), company.getCompanyFullname() + " 입사지원 합격여부 메일입니다.", sb.toString());
        } else {
            throw new CustomApiException("이메일 전송에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        
        return new ResponseEntity<>(new ResponseDto<>(1, "이메일 전송이 완료되었습니다.", null), HttpStatus.OK);
    }
}
