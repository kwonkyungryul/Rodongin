package shop.mtcoding.rodongin.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import shop.mtcoding.rodongin.dto.ResponseDto;
import shop.mtcoding.rodongin.dto.company.CompanyReq.CompanyJoinReqDto;
import shop.mtcoding.rodongin.dto.company.CompanyReq.CompanyLoginReqDto;
import shop.mtcoding.rodongin.dto.company.CompanyResp.CompanyDetailRespDto;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
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
    public String login(CompanyLoginReqDto companyLoginReqDto, HttpSession session, HttpServletResponse response, 
    @RequestParam(value = "remember", required = false) String companyUsername) {
        // System.out.println(companyLoginReqDto.getCompanyUsername());
        // System.out.println(companyLoginReqDto.getCompanyPassword());
        if (companyLoginReqDto.getCompanyUsername() == null || companyLoginReqDto.getCompanyUsername().isEmpty()) {
            throw new CustomException("기업아이디를 입력해주세요", HttpStatus.BAD_REQUEST);
        }
        if (companyLoginReqDto.getCompanyPassword() == null || companyLoginReqDto.getCompanyPassword().isEmpty()) {
            throw new CustomException("password를 입력해주세요", HttpStatus.BAD_REQUEST);
        }


        
        if (companyUsername ==  null || companyLoginReqDto.getCompanyUsername().isEmpty()) {
            companyUsername = "";
            
        }

        if (companyUsername.equals("on")) {
            Cookie cookie = new Cookie("remember", companyLoginReqDto.getCompanyUsername());
            cookie.setMaxAge(60);
            cookie.setPath("/");
            response.addCookie(cookie);
        } else {
            Cookie cookie = new Cookie("remember", "");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }

        Company principal = companyService.로그인(companyLoginReqDto);

        session.setAttribute("comPrincipal", principal);
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

    @PutMapping("/company/update")
    public ResponseEntity<?> update(MultipartFile profile,
    @ModelAttribute CompanyDetailRespDto companyDetailRespDto){
        Company comPrincipal = (Company) session.getAttribute("comPrincipal");
        if (comPrincipal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        if (companyDetailRespDto.getCompanyEstablish() == null){
            throw new CustomApiException("Etablish를 작성해주세요");
        } 
        if (companyDetailRespDto.getCompanyFullname() == null || companyDetailRespDto.getCompanyFullname().isEmpty()) {
            throw new CustomApiException("Fullname을 작성해주세요");
        }       
        if (companyDetailRespDto.getCompanyIntroduction() == null || companyDetailRespDto.getCompanyIntroduction().isEmpty()) {
            throw new CustomApiException("Introduction을 작성해주세요");
        }
        if (companyDetailRespDto.getCompanyHistory() == null || companyDetailRespDto.getCompanyHistory().isEmpty()) {
            throw new CustomApiException("History를 작성해주세요");
        }
        if (companyDetailRespDto.getCompanyVision() == null || companyDetailRespDto.getCompanyVision().isEmpty()) {
            throw new CustomApiException("Vision을 작성해주세요");
        }
        
        companyService.기업소개등록(companyDetailRespDto, comPrincipal.getId(), profile);


        return new ResponseEntity<>(new ResponseDto<>(1, "기업소개 수정성공", null), HttpStatus.OK);
            
        
    }


    @GetMapping("/company/saveForm")
    public String saveForm( Model model){
        Company comPrincipal = (Company) session.getAttribute("comPrincipal");
        if (comPrincipal == null) {
            throw new CustomException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        Company company = companyRepository.findById(comPrincipal.getId());
        if (company == null) {
            throw new CustomException("없는 기업소개를 수정할 수 없습니다");
        }

        model.addAttribute("detailDto", company);
        return "company/saveForm";
    }


    @GetMapping("/company/{id}")
    public String detail(@PathVariable int id, Model model) {
        model.addAttribute("detailDto", companyRepository.findById(id));

        return "company/detail";
    }

    @GetMapping("/company/joinForm")
    public String companyjoin(HttpServletRequest request) {

        String companyUsername = "";
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("remember")) {
                companyUsername = cookie.getValue();
            }
        }
        request.setAttribute("remember", companyUsername);
    
        return "company/joinForm";
    }
}
