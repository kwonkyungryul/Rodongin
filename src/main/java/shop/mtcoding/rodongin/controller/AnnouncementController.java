package shop.mtcoding.rodongin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import shop.mtcoding.rodongin.model.announcement.AnnouncementRepository;
import shop.mtcoding.rodongin.model.company.CompanyRepository;
import shop.mtcoding.rodongin.model.master.StackMaster;
import shop.mtcoding.rodongin.model.master.StackMasterRepository;

@Controller
public class AnnouncementController {
    
    
    @Autowired
    private StackMasterRepository stackMasterRepository;

    @Autowired
    private CompanyRepository companyRepository;

    @Autowired
    private AnnouncementRepository announcementRepository;

    @GetMapping({"/","/announcement"})
    public String list(Model model){
        List<StackMaster> stacks = stackMasterRepository.findAll();
        model.addAttribute("stacks", stacks);
       model.addAttribute("listview", announcementRepository.findAnnouncementlist());
      
       
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
