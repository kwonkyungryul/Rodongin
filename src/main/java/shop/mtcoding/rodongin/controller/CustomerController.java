package shop.mtcoding.rodongin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.rodongin.dto.ResponseDto;
import shop.mtcoding.rodongin.dto.customer.CustomerReq.CustomerSaveReqDto;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.model.customer.CustomerRepository;
import shop.mtcoding.rodongin.model.employee.Employee;
import shop.mtcoding.rodongin.model.employee.EmployeeRepository;
import shop.mtcoding.rodongin.service.customer.CustomerService;

@Controller
public class CustomerController {

    @Autowired
    private HttpSession session;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private EmployeeRepository employeeRepository;

    @PostMapping("/customer")
    public @ResponseBody ResponseEntity<?> save(@RequestBody CustomerSaveReqDto customerSaveReqDto) {
        Employee principal = (Employee) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        if (customerSaveReqDto.getCustomerTitle().length() > 100) {
            throw new CustomApiException("제목의 길이가 100자 이하여야 합니다.");
        }
        if (customerSaveReqDto.getCustomerContent() == null || customerSaveReqDto.getCustomerContent().isEmpty()) {
            throw new CustomApiException("내용을 작성해 주세요.");
        }

        customerService.글쓰기(customerSaveReqDto, principal.getId());

        // return "redirect:/";
        return new ResponseEntity<>(new ResponseDto<>(1, "글쓰기성공", null), HttpStatus.CREATED);
    }

    @GetMapping("/customer/list")
    public String list(Model model) {
        model.addAttribute("listDtos", customerRepository.findAllWithEmployee());

        return "customer/list";
    }

    @GetMapping("/customer/{id}")
    public String detail(@PathVariable int id) {
        return "customer/detail";
    }

    @GetMapping("/customer/saveForm")
    public String saveForm(Model model) {

        return "customer/saveForm";
    }

    @GetMapping("/customer/{id}/updateForm")
    public String updateForm(@PathVariable int id) {
        return "customer/updateForm";
    }

}
