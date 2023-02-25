package shop.mtcoding.rodongin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AnnouncementController {
    
    @GetMapping({"/","/announcement"})
    public String announcement(){
        return "announcement/announcement";
    }
}