package shop.mtcoding.rodongin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.rodongin.dto.ResponseDto;
import shop.mtcoding.rodongin.dto.announcement.AnnouncementReq.AnnouncementSaveReqDto;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.model.announcement.AnnouncementRepository;
import shop.mtcoding.rodongin.model.company.Company;
import shop.mtcoding.rodongin.model.company.CompanyRepository;
import shop.mtcoding.rodongin.model.master.StackMaster;
import shop.mtcoding.rodongin.model.master.StackMasterRepository;
import shop.mtcoding.rodongin.service.announcement.AnnouncementService;

@Controller
public class AnnouncementController {
    

    @Autowired
    private AnnouncementService announcementService;

    @Autowired
    private HttpSession session;

    @Autowired
    private StackMasterRepository stackMasterRepository;

    @Autowired
    private CompanyRepository companyRepository;

    @Autowired
    private AnnouncementRepository announcementRepository;

    
// 공고작성
@PostMapping("/announcement")
public @ResponseBody ResponseEntity<?> saveForm(@RequestBody AnnouncementSaveReqDto AnnouncementSaveReqDto){
    
    Company principal = (Company) session.getAttribute("principal");
    if (principal == null) {
        throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
    }
    if (AnnouncementSaveReqDto.getAnnouncementTitle() == null || AnnouncementSaveReqDto.getAnnouncementTitle().isEmpty()) {
        throw new CustomApiException("title을 작성해주세요");
    }
    if (AnnouncementSaveReqDto.getAnnouncementContent() == null || AnnouncementSaveReqDto.getAnnouncementContent().isEmpty()) {
        throw new CustomApiException("Content을 작성해주세요");
    }
    if (AnnouncementSaveReqDto.getAnnouncementCarrer() == null || AnnouncementSaveReqDto.getAnnouncementCarrer().isEmpty()) {
        throw new CustomApiException("Carrer을 작성해주세요");
    }
    if (AnnouncementSaveReqDto.getAnnouncementHireType() == null || AnnouncementSaveReqDto.getAnnouncementHireType().isEmpty()) {
        throw new CustomApiException("HireType을 작성해주세요");
    }
    if (AnnouncementSaveReqDto.getAnnouncementSalary() == null || AnnouncementSaveReqDto.getAnnouncementSalary().isEmpty()) {
        throw new CustomApiException("Salary을 작성해주세요");
    }
    if (AnnouncementSaveReqDto.getAnnouncementArea() == null || AnnouncementSaveReqDto.getAnnouncementArea().isEmpty()) {
        throw new CustomApiException("Area을 작성해주세요");
    }

    announcementService.공고등록(AnnouncementSaveReqDto, principal.getId());

    return new ResponseEntity<>(new ResponseDto<>(1, "게시글작성 성공", null), HttpStatus.CREATED);
}


    @GetMapping({"/","/announcement"})
    public String list(Model model){
        List<StackMaster> stacks = stackMasterRepository.findAll();
        model.addAttribute("stacks", stacks);
       model.addAttribute("listview", announcementRepository.findAnnouncementlist());
      
       
       return "announcement/list";
    }

    @GetMapping("announcement/{id}")
    public String detail(@PathVariable int id, Model model){
        model.addAttribute("announcement", announcementRepository.findAnnouncementAndCompanyId(id));
        model.addAttribute("tostack", stackMasterRepository.findById(id));
        model.addAttribute("delete", announcementRepository.findById(id));
        model.addAttribute("listview", announcementRepository.findAnnouncementlist());

        return "announcement/detail";
    }

    @GetMapping("announcement/saveForm")
    public String saveForm(Model model){
        List<StackMaster> stacks = stackMasterRepository.findAll();
        model.addAttribute("stacks", stacks);
        return "announcement/saveForm";
    }

    // 게시글 삭제
 @DeleteMapping("/announcement/{id}")
 public @ResponseBody ResponseEntity<?> delete(@PathVariable int id) {
     Company principal = (Company) session.getAttribute("principal");
     if (principal == null) {
         throw new CustomApiException("인증이 되지 않았습니다.");
     }
     announcementService.게시글삭제(id, principal.getId());
     return new ResponseEntity<>(new ResponseDto<>(1, "삭제성공", null), HttpStatus.OK);
 }

}
