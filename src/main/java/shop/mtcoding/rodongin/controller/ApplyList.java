package shop.mtcoding.rodongin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ApplyList {
    
   @GetMapping("/apply/applyList")
    public String applyList() {
        return "apply/applyList";
    }
}
