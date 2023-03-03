package shop.mtcoding.rodongin.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.rodongin.dto.ResponseDto;
import shop.mtcoding.rodongin.dto.announcement.AnnouncementReq.AnnouncementSaveReqDto;
import shop.mtcoding.rodongin.dto.announcement.AnnouncementReq.AnnouncementUpdateReqDto;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.announcement.Announcement;
import shop.mtcoding.rodongin.model.announcement.AnnouncementRepository;
import shop.mtcoding.rodongin.model.company.Company;
import shop.mtcoding.rodongin.model.company.CompanyRepository;
import shop.mtcoding.rodongin.model.employee.Employee;
import shop.mtcoding.rodongin.model.master.StackMaster;
import shop.mtcoding.rodongin.model.master.StackMasterRepository;
import shop.mtcoding.rodongin.model.resume.ResumeRepository;
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
    private ResumeRepository resumeRepository;

    @Autowired
    private CompanyRepository companyRepository;

    @Autowired
    private AnnouncementRepository announcementRepository;

    // 게시글 수정
    @PutMapping("/announcement/{id}")
    public @ResponseBody ResponseEntity<?> update(@PathVariable int id,
            @RequestBody AnnouncementUpdateReqDto announcementUpdateReqDto, HttpServletResponse response) {

        Company principal = (Company) session.getAttribute("comPrincipal");
        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다.", HttpStatus.UNAUTHORIZED);
        }
        if (announcementUpdateReqDto.getAnnouncementTitle() == null
                || announcementUpdateReqDto.getAnnouncementTitle().isEmpty()) {
            throw new CustomApiException("title을 작성해주세요");
        }
        if (announcementUpdateReqDto.getAnnouncementContent() == null
                || announcementUpdateReqDto.getAnnouncementTitle().isEmpty()) {
            throw new CustomApiException("Content을 작성해주세요");
        }
        if (announcementUpdateReqDto.getAnnouncementCarrer() == null
                || announcementUpdateReqDto.getAnnouncementTitle().isEmpty()) {
            throw new CustomApiException("Carrer을 작성해주세요");
        }
        if (announcementUpdateReqDto.getAnnouncementHireType() == null
                || announcementUpdateReqDto.getAnnouncementTitle().isEmpty()) {
            throw new CustomApiException("HireType을 작성해주세요");
        }
        if (announcementUpdateReqDto.getAnnouncementSalary() == null
                || announcementUpdateReqDto.getAnnouncementTitle().isEmpty()) {
            throw new CustomApiException("Salary을 작성해주세요");
        }
        if (announcementUpdateReqDto.getAnnouncementArea() == null
                || announcementUpdateReqDto.getAnnouncementTitle().isEmpty()) {
            throw new CustomApiException("Area을 작성해주세요");
        }

        announcementService.게시글수정(id, announcementUpdateReqDto, principal.getId());
        return new ResponseEntity<>(new ResponseDto<>(1, "게시글수정성공", null), HttpStatus.OK);
    }

    // 게시글 가져오기
    @GetMapping("/announcement/{id}/updateForm")
    public String updateForm(@PathVariable int id, Model model) {
        List<StackMaster> stacks = stackMasterRepository.findAll();
        model.addAttribute("stacks", stacks);

        Company principal = (Company) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomException("인증이 되지 않았당", HttpStatus.UNAUTHORIZED);
        }
        Announcement announcementPS = announcementRepository.findById(id);
        model.addAttribute("listview", announcementRepository.findAnnouncementlist());
        if (announcementPS == null) {
            throw new CustomException("없는 게시글을 수정할 수 없다.");
        }
        if (announcementPS.getId() != principal.getId()) {
            throw new CustomException("게시글을 수정할 권한이 없당");
        }
        model.addAttribute("announcement", announcementPS);
        return "announcement/updateForm";
    }

    // 공고작성
    @PostMapping("/announcement")
    public @ResponseBody ResponseEntity<?> saveForm(@RequestBody AnnouncementSaveReqDto AnnouncementSaveReqDto) {

        Company principal = (Company) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        if (AnnouncementSaveReqDto.getAnnouncementTitle() == null
                || AnnouncementSaveReqDto.getAnnouncementTitle().isEmpty()) {
            throw new CustomApiException("title을 작성해주세요");
        }
        if (AnnouncementSaveReqDto.getAnnouncementContent() == null
                || AnnouncementSaveReqDto.getAnnouncementContent().isEmpty()) {
            throw new CustomApiException("Content을 작성해주세요");
        }
        if (AnnouncementSaveReqDto.getAnnouncementCarrer() == null
                || AnnouncementSaveReqDto.getAnnouncementCarrer().isEmpty()) {
            throw new CustomApiException("Carrer을 작성해주세요");
        }
        if (AnnouncementSaveReqDto.getAnnouncementHireType() == null
                || AnnouncementSaveReqDto.getAnnouncementHireType().isEmpty()) {
            throw new CustomApiException("HireType을 작성해주세요");
        }
        if (AnnouncementSaveReqDto.getAnnouncementSalary() == null
                || AnnouncementSaveReqDto.getAnnouncementSalary().isEmpty()) {
            throw new CustomApiException("Salary을 작성해주세요");
        }
        if (AnnouncementSaveReqDto.getAnnouncementArea() == null
                || AnnouncementSaveReqDto.getAnnouncementArea().isEmpty()) {
            throw new CustomApiException("Area을 작성해주세요");
        }

        announcementService.공고등록(AnnouncementSaveReqDto, principal.getId());

        return new ResponseEntity<>(new ResponseDto<>(1, "게시글작성 성공", null), HttpStatus.CREATED);
    }

    @GetMapping({ "/", "/announcement" })
    public String list(Model model) {
        List<StackMaster> stacks = stackMasterRepository.findAll();
        model.addAttribute("stacks", stacks);
        model.addAttribute("listview", announcementRepository.findAnnouncementlist());

        return "announcement/list";
    }

    @GetMapping("announcement/{id}")
    public String detail(@PathVariable int id, Model model) {

        Employee principal = (Employee) session.getAttribute("principal");
        if (principal != null) {
            int employeeId = principal.getId();
            model.addAttribute("resumes", resumeRepository.findByEmployeeId(employeeId));
            // throw new CustomException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }

        model.addAttribute("announcement", announcementRepository.findAnnouncementAndCompanyId(id));
        model.addAttribute("tostack", stackMasterRepository.findById(id));
        model.addAttribute("delete", announcementRepository.findById(id));
        model.addAttribute("listview", announcementRepository.findAnnouncementlist());
        model.addAttribute("company", companyRepository.findById(id));

        return "announcement/detail";
    }

    @GetMapping("announcement/saveForm")
    public String saveForm(Model model) {
        List<StackMaster> stacks = stackMasterRepository.findAll();
        model.addAttribute("stacks", stacks);
        return "announcement/saveForm";
    }

    // 게시글 삭제
    @DeleteMapping("/announcement/{id}")
    public @ResponseBody ResponseEntity<?> delete(@PathVariable int id) {
        Company comPrincipal = (Company) session.getAttribute("comPrincipal");
        if (comPrincipal == null) {
            throw new CustomApiException("인증이 되지 않았습니다.");
        }
        announcementService.게시글삭제(id, comPrincipal.getId());

        return new ResponseEntity<>(new ResponseDto<>(1, "삭제성공", null), HttpStatus.OK);
    }

}
