package shop.mtcoding.rodongin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import shop.mtcoding.rodongin.dto.apply.ApplyRes.ApplyListResDto;
import shop.mtcoding.rodongin.dto.apply.ApplyRes.ApplyListResumeResDto;
import shop.mtcoding.rodongin.model.apply.Apply;
import shop.mtcoding.rodongin.model.apply.ApplyRepository;
import shop.mtcoding.rodongin.model.resume.Resume;
import shop.mtcoding.rodongin.model.resume.ResumeGraduate;
import shop.mtcoding.rodongin.model.resume.ResumeGraduateRepository;
import shop.mtcoding.rodongin.model.resume.ResumeRepository;

@Controller
public class ApplyController {
    // employeeFullname, employee_address, resume_title,
    @Autowired
    ApplyRepository applyRepository;

    @Autowired
    ResumeRepository resumeRepository;

    @Autowired
    ResumeGraduateRepository resumeGraduateRepository;

    // @Autowired
    // ResumeCareerRepository resumeCareerRepository;

    @GetMapping("/apply/{companyId}/list")
    public String applyList(@PathVariable int companyId, Model model) {
        List<ApplyListResDto> applys = applyRepository.findByCompanyId(companyId);

        model.addAttribute("applys", applys);
        return "apply/list";
    }
}
