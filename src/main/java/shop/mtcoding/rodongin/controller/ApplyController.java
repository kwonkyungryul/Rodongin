package shop.mtcoding.rodongin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.company.Company;
import shop.mtcoding.rodongin.service.apply.ApplyService;

@Controller
public class ApplyController {

    @Autowired
    private HttpSession session;

    @Autowired
    private ApplyService applyService;

    @GetMapping("/apply/list")
    public String applyList() {
        return "apply/list";
    }

    @PostMapping("/apply")
    public String apply(int announcementId, int resumeId) {

        Company principal = (Company) session.getAttribute("principal");

        if (principal == null) {
            throw new CustomException("인증이 되지 않았습니다.", HttpStatus.UNAUTHORIZED);
        }
        applyService.지원하기(announcementId, resumeId);

        return "redirect:/announcement/" + announcementId;
    }
}
