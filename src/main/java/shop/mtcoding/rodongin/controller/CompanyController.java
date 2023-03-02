package shop.mtcoding.rodongin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import shop.mtcoding.rodongin.dto.company.CompanyReq.CompanyJoinReqDto;
import shop.mtcoding.rodongin.dto.company.CompanyReq.CompanyLoginReqDto;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.company.Company;
import shop.mtcoding.rodongin.model.company.CompanyRepository;
import shop.mtcoding.rodongin.service.company.CompanyService;

@Controller
public class CompanyController {

    @Autowired
    private CompanyRepository companyRepository;

    @Autowired
    private HttpSession session;

    @Autowired
    private CompanyService companyService;

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
        session.setAttribute("principal", principal);

        if (principal == null) {
            throw new CustomException("아이디 혹은 비번이 틀렸습니다", HttpStatus.BAD_REQUEST);
        }
        return "redirect:/";
    }

    @PostMapping("/company/join")
    public String join(CompanyJoinReqDto companyJoinReqDto) throws Exception {

        if (companyJoinReqDto.getCompanyUsername() == null || companyJoinReqDto.getCompanyUsername().isEmpty()) {
            throw new CustomException("아이디를 작성해주세요");
        }
        if (companyJoinReqDto.getCompanyPassword() == null || companyJoinReqDto.getCompanyPassword().isEmpty()) {
            throw new CustomException("비밀번호를 작성해주세요");
        }
        if (companyJoinReqDto.getCompanyLicenseNumber() == null
                || companyJoinReqDto.getCompanyLicenseNumber().isEmpty()) {
            throw new CustomException("사업자등록번호를 작성해주세요");
        }
        if (companyJoinReqDto.getCompanyCeoName() == null || companyJoinReqDto.getCompanyCeoName().isEmpty()) {
            throw new CustomException("대표자 성함을 작성해주세요");
        }
        if (companyJoinReqDto.getCompanyFullname() == null || companyJoinReqDto.getCompanyFullname().isEmpty()) {
            throw new CustomException("기업명을 작성해주세요");
        }
        if (companyJoinReqDto.getCompanyTel() == null || companyJoinReqDto.getCompanyTel().isEmpty()) {
            throw new CustomException("연락처를 작성해주세요");
        }
        if (companyJoinReqDto.getCompanyAddress() == null || companyJoinReqDto.getCompanyAddress().isEmpty()) {
            throw new CustomException("주소를 작성해주세요");
        }
        if (companyJoinReqDto.getCompanyEmail() == null || companyJoinReqDto.getCompanyEmail().isEmpty()) {
            throw new CustomException("email을 작성해주세요");
        }

        String tel = companyJoinReqDto.getCompanyTel().replaceAll(",", "");
        companyJoinReqDto.setCompanyTel(tel);

        String address = companyJoinReqDto.getCompanyAddress().replaceAll(",", "");
        companyJoinReqDto.setCompanyAddress(address);

        String email = companyJoinReqDto.getCompanyEmail().replaceAll(",", "");
        // System.out.println(email);
        companyJoinReqDto.setCompanyEmail(email);

        companyService.회원가입(companyJoinReqDto);
        return "redirect:/loginForm";

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
