package shop.mtcoding.rodongin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.rodongin.dto.ResponseDto;
import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeCareerSaveDto;
import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeGraduateSaveDto;
import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeLicenseSaveDto;
import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeSaveDto;
import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeStackSaveDto;
import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeGraduateRespDto;
import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeLicenseRespDto;
import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeStackRespDto;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.model.employee.Employee;
import shop.mtcoding.rodongin.model.employee.EmployeeRepository;
import shop.mtcoding.rodongin.model.resume.ResumeCareer;
import shop.mtcoding.rodongin.model.resume.ResumeCareerRepository;
import shop.mtcoding.rodongin.model.resume.ResumeGraduateRepository;
import shop.mtcoding.rodongin.model.resume.ResumeLicenseRepository;
import shop.mtcoding.rodongin.model.resume.ResumeRepository;
import shop.mtcoding.rodongin.model.resume.ResumeStackRepository;
import shop.mtcoding.rodongin.service.resume.ResumeService;
import shop.mtcoding.rodongin.util.MySession;

@Controller
public class ResumeController {

    @Autowired
    private HttpSession session;
    @Autowired
    private ResumeService resumeService;

    @Autowired
    private EmployeeRepository employeeRepository;
    @Autowired
    private ResumeGraduateRepository resumeGraduateRepository;
    @Autowired
    private ResumeCareerRepository resumeCareerRepository;
    @Autowired
    private ResumeLicenseRepository resumeLicenseRepository;
    @Autowired
    private ResumeStackRepository resumeStackRepository;
    @Autowired
    private ResumeRepository resumeRepository;

    @DeleteMapping("/resume/{id}")
    public @ResponseBody ResponseEntity<?> delete(@PathVariable("id") int id) {
        Employee principal = MySession.MyPrincipal(session);
        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        resumeService.delete(id, principal.getId());
        return new ResponseEntity<>(new ResponseDto<>(1, "이력서 삭제 성공", null), HttpStatus.OK);
    }

    @GetMapping("/resume/{id}/detail")
    public String resume(@PathVariable int id, Model model) {
        Employee principal = MySession.MyPrincipal(session);

        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }

        model.addAttribute("empInfo", employeeRepository.findById(principal.getId()));

        List<ResumeCareer> resumeCareers = resumeCareerRepository.findByResumeId(id);
        model.addAttribute("resumeCareers", resumeCareers);

        List<ResumeGraduateRespDto> resumeGraduates = resumeGraduateRepository.findByResumeId(id);
        model.addAttribute("resumeGraduates", resumeGraduates);

        List<ResumeLicenseRespDto> resumeLicense = resumeLicenseRepository.findByResumeId(id);
        model.addAttribute("resumeLicense", resumeLicense);

        List<ResumeStackRespDto> resumeStack = resumeStackRepository.findByResumeId(id);
        model.addAttribute("resumeStack", resumeStack);

        model.addAttribute("resume", resumeRepository.findById(id));

        return "resume/detail";
    }

    @PostMapping("/resume/save")
    public @ResponseBody ResponseEntity<?> resumeSave(@RequestBody ResumeSaveDto resumeSaveDto) {
        System.out.println(resumeSaveDto.getCV());
        System.out.println(resumeSaveDto.getResumeSalary());
        System.out.println(resumeSaveDto.getResumeTitle());
        Employee principal = MySession.MyPrincipal(session);

        if (principal == null) {
             throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }

        resumeService.이력서등록(resumeSaveDto, principal.getId());
        // if (resumeCareerSaveDto.getCareerStart().toString().equals("0001-01-01")) {
        //     resumeCareerSaveDto.setCareerStart(null);
        // }
        // if (resumeCareerSaveDto.getCareerEnd().toString().equals("0001-01-01")) {
        //     resumeCareerSaveDto.setCareerEnd(null);
        // }
        return new ResponseEntity<>(new ResponseDto<>(1, "이력서 등록 성공", resumeSaveDto.getId()), HttpStatus.OK);
    }

    @GetMapping("/resume/saveForm")
    public String resumeForm(Model model) {
        Employee principal = MySession.MyPrincipal(session);

        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        model.addAttribute("empInfo", employeeRepository.findById(principal.getId()));

        return "resume/saveForm";
    }
}
