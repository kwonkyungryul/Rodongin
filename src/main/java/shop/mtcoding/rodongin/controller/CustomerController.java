package shop.mtcoding.rodongin.controller;

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

    @PostMapping("/customer")
    public String save(CustomerSaveReqDto customerSaveReqDto) {
        Customer principal = (Customer) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        if (CustomerSaveReqDto.getCu.length() > 100) {
            throw new CustomException("title의 길이가 100자 이하여야 합니다");
        }
        // if (CustomerSaveReqDto.getCustomerContent() == null ||
        // BoardSaveReqDto.getCustomerContent().isEmpty()) {
        // throw new CustomException("content를 작성해주세요");
    }

    CustomerService.글쓰기(BoardSaveReqDto,principal.getId());

    return"redirect:/";

    }

    @GetMapping("/customer/list")
    public String list(Model model) {
        return "customer/list";
    }

}
