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

    // company 로그인요청
    @PostMapping("/company/login")
    public String login(CompanyLoginReqDto companyLoginReqDto) {
        // System.out.println(companyLoginReqDto.getCompanyUsername());
        // System.out.println(companyLoginReqDto.getCompanyPassword());
        if (companyLoginReqDto.getCompanyUsername() == null || companyLoginReqDto.getCompanyUsername().isEmpty()) {
            throw new CustomException("기업아이디를 입력해주세요", HttpStatus.BAD_REQUEST);
        }
        if (companyLoginReqDto.getCompanyPassword() == null || companyLoginReqDto.getCompanyPassword().isEmpty()) {
            throw new CustomException("password를 입력해주세요", HttpStatus.BAD_REQUEST);
        }

        Company principal = companyRepository.findByCompanyNameAndPassword(companyLoginReqDto);

        if (principal == null) {
            throw new CustomException("아이디 혹은 비번이 틀렸습니다", HttpStatus.BAD_REQUEST);
        }

        session.setAttribute("principal", principal);

        return "redirect:/";
    }

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
