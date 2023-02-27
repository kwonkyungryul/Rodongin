package shop.mtcoding.rodongin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ApplyController {
    
   @GetMapping("/apply/list")
    public String applyList() {
        return "apply/list";
    }
}
