package shop.mtcoding.rodongin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ResumeController {
    
@GetMapping("/resume/1")
    public String resume() {
        return "resume/detail";
    }
    @GetMapping("/resume/resumeForm")
    public String resumeForm() {
        return "resume/resumeForm";
    }
}
