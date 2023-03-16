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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.rodongin.dto.ResponseDto;
import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeSaveDto;
import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeUpdateDto;
import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeGraduateRespDto;
import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeLicenseRespDto;
import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeListRespDto;
import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeStackRespDto;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.employee.Employee;
import shop.mtcoding.rodongin.model.employee.EmployeeRepository;
import shop.mtcoding.rodongin.model.master.LicenseMaster;
import shop.mtcoding.rodongin.model.master.LicenseMasterRepository;
import shop.mtcoding.rodongin.model.master.SchoolMaster;
import shop.mtcoding.rodongin.model.master.SchoolMasterRepository;
import shop.mtcoding.rodongin.model.master.StackMaster;
import shop.mtcoding.rodongin.model.master.StackMasterRepository;
import shop.mtcoding.rodongin.model.resume.Resume;
import shop.mtcoding.rodongin.model.resume.ResumeCareer;
import shop.mtcoding.rodongin.model.resume.ResumeCareerRepository;
import shop.mtcoding.rodongin.model.resume.ResumeGraduateRepository;
import shop.mtcoding.rodongin.model.resume.ResumeLicenseRepository;
import shop.mtcoding.rodongin.model.resume.ResumeRepository;
import shop.mtcoding.rodongin.model.resume.ResumeStackRepository;
import shop.mtcoding.rodongin.service.resume.ResumeService;

@Controller
public class ResumeController {

    @Autowired
    private HttpSession session;
    @Autowired
    private ResumeService resumeService;
    @Autowired
    private SchoolMasterRepository schoolMasterRepository;

    @Autowired
    private LicenseMasterRepository licenseMasterRepository;

    @Autowired
    private StackMasterRepository stackMasterRepository;

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

    @PutMapping("resume/{id}/update")
    public @ResponseBody ResponseEntity<?> update(@PathVariable int id, @RequestBody ResumeUpdateDto resumeUpdateDto) {

        Employee principal = (Employee) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }

        resumeService.이력서수정(id, resumeUpdateDto);

        return new ResponseEntity<>(new ResponseDto<>(1, "이력서 수정 완료!", null), HttpStatus.OK);
    }

    @GetMapping("resume/{id}/update")
    public String updateForm(@PathVariable int id, Model model, ResumeListRespDto resumeListRespDto) {
        Employee principal = (Employee) session.getAttribute("principal");

        if (principal == null) {
            throw new CustomException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }

        // 개인정보
        model.addAttribute("empInfo",
                employeeRepository.findById(principal.getId()));
        // 마스터 테이블
        List<SchoolMaster> schools = schoolMasterRepository.findAll();
        List<LicenseMaster> licenses = licenseMasterRepository.findAll();
        List<StackMaster> stacks = stackMasterRepository.findAll();
        model.addAttribute("empInfo", employeeRepository.findById(principal.getId()));
        model.addAttribute("schools", schools);
        model.addAttribute("licenses", licenses);
        model.addAttribute("stacks", stacks);
        // 이력서
        Resume resume = resumeRepository.findById(id);
        model.addAttribute("resume", resume);

        List<ResumeCareer> resumeCareers = resumeCareerRepository.findByResumeId(id);
        model.addAttribute("resumeCareers", resumeCareers);

        List<ResumeGraduateRespDto> resumeGraduates = resumeGraduateRepository.findByResumeId(id);
        model.addAttribute("resumeGraduates", resumeGraduates);

        List<ResumeLicenseRespDto> resumeLicense = resumeLicenseRepository.findByResumeId(id);
        model.addAttribute("resumeLicense", resumeLicense);

        List<ResumeStackRespDto> resumeStack = resumeStackRepository.findByResumeId(id);
        model.addAttribute("resumeStack", resumeStack);

        return "resume/update";
    }

    @DeleteMapping("/resume/{id}")
    public @ResponseBody ResponseEntity<?> delete(@PathVariable("id") int id) {
        Employee principal = (Employee) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        resumeService.delete(id, principal.getId());
        return new ResponseEntity<>(new ResponseDto<>(1, "이력서 삭제 성공", null), HttpStatus.OK);
    }

    @GetMapping("/resume/{id}/detail")
    public String resume(@PathVariable int id, Model model) {
        Employee principal = (Employee) session.getAttribute("principal");
        Resume resume = resumeRepository.findById(id);
        if (resume == null) {
            throw new CustomException("존재하지 않는 이력서입니다.");
        }
        // if (principal == null) {
        //     throw new CustomException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        // }

        model.addAttribute("empInfo", employeeRepository.findById(resume.getEmployeeId()));

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
        System.out.println(resumeSaveDto.toString());

        Employee principal = (Employee) session.getAttribute("principal");

        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }

        resumeService.이력서등록(resumeSaveDto, principal.getId());

        return new ResponseEntity<>(new ResponseDto<>(1, "이력서 등록 성공", resumeSaveDto.getId()), HttpStatus.OK);
    }

    @GetMapping("/resume/saveForm")
    public String resumeForm(Model model) {

        Employee principal = (Employee) session.getAttribute("principal");

        if (principal == null) {
            throw new CustomException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);

        }
        model.addAttribute("empInfo", employeeRepository.findById(principal.getId()));

        List<SchoolMaster> schools = schoolMasterRepository.findAll();
        List<LicenseMaster> licenses = licenseMasterRepository.findAll();
        List<StackMaster> stacks = stackMasterRepository.findAll();
        model.addAttribute("empInfo", employeeRepository.findById(principal.getId()));
        model.addAttribute("schools", schools);
        model.addAttribute("licenses", licenses);
        model.addAttribute("stacks", stacks);

        return "resume/saveForm";
    }
}
