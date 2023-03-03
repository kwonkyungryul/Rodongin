package shop.mtcoding.rodongin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ResumeController {
    
    @GetMapping("/resume/{id}")
    public String resume(@PathVariable int id) {
        return "resume/detail";
    }

    @GetMapping("/resume/saveForm")
    public String resumeForm() {
        return "resume/saveForm";
    }
}
