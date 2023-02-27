package shop.mtcoding.rodongin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CompanyController {

    @PostMapping("/company/joinForm")
    public String join() {
        return "company/joinForm";

    }

    @GetMapping("/company/saveForm")
    public String saveForm() {
        return "company/saveForm";
    }

    @GetMapping("/company/1")
    public String detail() {
        return "company/detail";
    }

    @GetMapping("/company/joinForm")
    public String companyjoin() {
        return "company/joinForm";
    }
}
