package shop.mtcoding.rodongin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import shop.mtcoding.rodongin.dto.customer.CustomerReq.CustomerSaveReqDto;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.customer.Customer;

@Controller
public class CustomerController {

    @Autowired
    private HttpSession session;

    @PostMapping("/customer")
    public String save(CustomerSaveReqDto customerSaveReqDto) {
        Customer principal = (Customer) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        if (customerSaveReqDto.getCustomerTitle().length() > 100) {
            throw new CustomException("제목의 길이가 100자 이하여야 합니다.");
        }
        if (customerSaveReqDto.getCustomerContent() == null || customerSaveReqDto.getCustomerContent().isEmpty()) {
            throw new CustomException("내용을 작성해 주세요.");
        }

        // CustomerService.글쓰기(CustomerSaveReqDto,principal.getId());

        return "redirect:/";

    }

    @GetMapping("/customer/list")
    public String list(Model model) {
        return "customer/list";
    }

}
