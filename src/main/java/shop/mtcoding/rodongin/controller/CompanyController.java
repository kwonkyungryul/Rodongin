package shop.mtcoding.rodongin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CompanyController {

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
