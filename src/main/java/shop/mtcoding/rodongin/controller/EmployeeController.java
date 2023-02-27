package shop.mtcoding.rodongin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EmployeeController {

    @GetMapping("/employee/{id}")
    public String detail(Model model) {
        return "employee/detail";
    }

    @GetMapping("/employee/updateForm")
    public String infoUpdateForm() {
        return "employee/updateForm";
    }

    @GetMapping("/login")
    public String login() {
        return "loginForm";
    }

    @GetMapping("/employee/joinForm")
    public String employeejoin() {
        return "employee/joinForm";
    }
}
