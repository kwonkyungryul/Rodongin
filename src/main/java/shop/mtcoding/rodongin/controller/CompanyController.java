package shop.mtcoding.rodongin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import shop.mtcoding.rodongin.dto.company.CompanyReq.CompanyLoginReqDto;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.company.Company;
import shop.mtcoding.rodongin.model.company.CompanyRepository;

@Controller
public class CompanyController {

    @Autowired
    private CompanyRepository companyRepository;

    @Autowired
    private HttpSession session;

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
