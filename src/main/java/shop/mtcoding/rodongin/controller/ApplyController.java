package shop.mtcoding.rodongin.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import shop.mtcoding.rodongin.dto.apply.ApplyResp.ApplyListRespDto;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.apply.ApplyRepository;
import shop.mtcoding.rodongin.model.company.Company;
import shop.mtcoding.rodongin.model.employee.Employee;
import shop.mtcoding.rodongin.model.resume.ResumeGraduateRepository;
import shop.mtcoding.rodongin.model.resume.ResumeRepository;
import shop.mtcoding.rodongin.service.apply.ApplyService;

@Controller
public class ApplyController {
    // employeeFullname, employee_address, resume_title,
    @Autowired
    ApplyRepository applyRepository;

    @Autowired
    ResumeRepository resumeRepository;

    @Autowired
    ResumeGraduateRepository resumeGraduateRepository;

    @Autowired
    ApplyService applyService;

    @Autowired
    HttpSession session;

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

    // @PostMapping("/apply/sendEmail")
    // public String sendEmail() {
        
    // }
}
