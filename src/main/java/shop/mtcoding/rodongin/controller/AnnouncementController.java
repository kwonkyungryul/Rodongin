package shop.mtcoding.rodongin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AnnouncementController {
    
    @GetMapping({"/","/announcement"})
    public String list(){
        return "announcement/list";
    }

    @GetMapping("announcement/1")
    public String detail(){
        return "announcement/detail";
    }

    @GetMapping("announcement/saveForm")
    public String saveForm(){
        return "announcement/saveForm";
    }
}
