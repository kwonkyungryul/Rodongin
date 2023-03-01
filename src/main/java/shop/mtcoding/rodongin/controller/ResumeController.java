package shop.mtcoding.rodongin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.rodongin.dto.ResponseDto;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.employee.Employee;
import shop.mtcoding.rodongin.service.ResumeService;
import shop.mtcoding.rodongin.util.MySession;



@Controller
public class ResumeController {
    
        @Autowired
        private HttpSession session;

        @Autowired
        private ResumeService resumeService;
    
        @DeleteMapping("/resume/{id}")
        public @ResponseBody ResponseEntity<?> delete(@PathVariable("id") int id) {
        Employee principal = MySession.MyPrincipal(session);

        if (principal == null) {
            throw new CustomException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        resumeService.delete(id, principal.getId());
        return new ResponseEntity<>(new ResponseDto<>(1, "댓글 삭제 성공", null), HttpStatus.OK);
    }
    
    @GetMapping("/resume/1")
    public String resume() {
        return "resume/detail";
    }

    @GetMapping("/resume/saveForm")
    public String resumeForm() {
        return "resume/saveForm";
    }
}
