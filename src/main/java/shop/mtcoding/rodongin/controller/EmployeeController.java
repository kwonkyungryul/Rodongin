package shop.mtcoding.rodongin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EmployeeController {

    @GetMapping("/employee/info")
    public String info() {
        return "employee/info";
    }

    @GetMapping("/employee/infoUpdateForm")
    public String infoUpdateForm() {
        return "employee/infoUpdateForm";
    }

    @GetMapping("/employee/joinForm")
    public String employeejoin() {
        return "employee/joinForm";
    }

    @GetMapping("/login")
    public String login() {
        return "loginForm";
    }
}
