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
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.rodongin.dto.ResponseDto;
import shop.mtcoding.rodongin.dto.resume.ResumeResp.ResumeGraduteRespDto;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.model.employee.Employee;
import shop.mtcoding.rodongin.model.resume.ResumeRepository;
import shop.mtcoding.rodongin.service.ResumeService;
import shop.mtcoding.rodongin.util.MySession;



@Controller
public class ResumeController {
    
    @Autowired
    private HttpSession session;
    @Autowired
    private ResumeService resumeService;

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
    
    @GetMapping("/resume/{id}")
    public String resume(Model model) {
        Employee principal = MySession.MyPrincipal(session);

        // List <ResumeGraduteRespDto> resumeGradutes = resumeRepository.findGraduteByEmpId(principal.getId());
        // model.addAttribute("resumeGradutes", resumeGradutes);



        return "resume/detail";
    }

    @GetMapping("/resume/saveForm")
    public String resumeForm() {
        return "resume/saveForm";
    }
}
