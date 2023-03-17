package shop.mtcoding.rodongin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.rodongin.dto.ResponseDto;
import shop.mtcoding.rodongin.dto.announcement.AnnouncementReq.AnnouncementSaveReqDto;
import shop.mtcoding.rodongin.dto.announcement.AnnouncementReq.AnnouncementUpdateReqDto;
import shop.mtcoding.rodongin.dto.announcement.AnnouncementResp.AnnouncementDetailRespDto;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.announcement.Announcement;
import shop.mtcoding.rodongin.model.announcement.AnnouncementRepository;
import shop.mtcoding.rodongin.model.company.Company;
import shop.mtcoding.rodongin.model.company.CompanyRepository;
import shop.mtcoding.rodongin.model.employee.Employee;
import shop.mtcoding.rodongin.model.employee.EmployeeStack;
import shop.mtcoding.rodongin.model.employee.EmployeeStackRepository;
import shop.mtcoding.rodongin.model.master.StackMaster;
import shop.mtcoding.rodongin.model.master.StackMasterRepository;
import shop.mtcoding.rodongin.model.resume.ResumeRepository;
import shop.mtcoding.rodongin.model.subscribe.Subscribe;
import shop.mtcoding.rodongin.model.subscribe.SubscribeRepository;
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

    @Autowired
    private SubscribeRepository subscribeRepository;

    @Autowired
    private EmployeeStackRepository employeeStackRepository;

   
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

        if (announcementUpdateReqDto.getStackId() == null
        || announcementUpdateReqDto.getStackId() == 0) {
            throw new CustomApiException("기술선택을 선택해주세요");
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

        Company comPrincipal = (Company) session.getAttribute("comPrincipal");
        if (comPrincipal == null) {
            throw new CustomException("인증이 되지 않았당", HttpStatus.UNAUTHORIZED);
        }
        Announcement announcementPS = announcementRepository.findById(id);
        if (announcementPS == null) {
            throw new CustomException("없는 게시글을 수정할 수 없다.");
        }
        if (comPrincipal.getId() != comPrincipal.getId()) {
            throw new CustomException("게시글을 수정할 권한이 없당");
        }
        model.addAttribute("announcement", announcementPS);
        return "announcement/updateForm";
    }

    // 공고작성
    @PostMapping("/announcement")
    public @ResponseBody ResponseEntity<?> saveForm(@RequestBody AnnouncementSaveReqDto AnnouncementSaveReqDto) {

        Company comPrincipal = (Company) session.getAttribute("comPrincipal");
        if (comPrincipal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }

        if (AnnouncementSaveReqDto.getStackId() == null
                || AnnouncementSaveReqDto.getStackId() == 0) {
            throw new CustomApiException("기술선택을 선택해주세요");
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

        announcementService.공고등록(AnnouncementSaveReqDto, comPrincipal.getId());

        return new ResponseEntity<>(new ResponseDto<>(1, "게시글작성 성공", null), HttpStatus.CREATED);
    }

    @GetMapping({ "/", "/announcement" })
    public String list(Model model,
                @RequestParam(defaultValue = "1") int num,
                @RequestParam(defaultValue = "") String content) {
        Employee principal = (Employee) session.getAttribute("principal");
        List<String> skills = new ArrayList<>();
        List<AnnouncementDetailRespDto> announcementDetailDto;

        int cnt;
        if (principal != null) { // 로그인이 되어 있을 때
            List<EmployeeStack> stacks = employeeStackRepository.findByEmployeeId(principal.getId());
            // throw new CustomException("aa");
            for (int i = 0; i < stacks.size(); i++) {
                skills.add(stacks.get(i).getStackId().toString());
            }
            cnt = announcementRepository.findAnnouncementCount(skills, content);
        } else { // 비로그인 일 때
            List<StackMaster> stackMasters = stackMasterRepository.findAll();
            for (int i = 0; i < stackMasters.size(); i++) {
                skills.add(stackMasters.get(i).getId().toString());
            }
            cnt = announcementRepository.findAnnouncementCount(skills, content);
        }
        
        int end = 10; // 한 페이지에 보여줄 게시물 수
		int pageNum = (int) Math.ceil( (double) cnt / end ); // 페이지 번호
        
		int start = (num - 1) * end; // 0에서 부터 10개 자르기
        
		int pageNum_cnt = 10; // 페이지 개수 번호를 10개씩만 출력
        
		int endPageNum = (int) (Math.ceil((double) num / (double)pageNum_cnt) * pageNum_cnt);
        
		int startPageNum = endPageNum - ( pageNum_cnt - 1 );
        
		int lastPageNum = (int) (Math.ceil((double)cnt / (double) pageNum_cnt));
        
		if( endPageNum > lastPageNum ) {
            endPageNum = lastPageNum;
		}
        
        boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= cnt ? false : true;

        for (int i = 0; i < skills.size(); i++) {
            System.out.println(skills.get(i));
        }
        announcementDetailDto = announcementRepository.findAnnouncementlist(skills.size() == 0 ? null : skills, content, start, end);
        
        System.out.println(num);
        model.addAttribute("prev", prev);
        model.addAttribute("next", next);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("startPageNum", startPageNum);
        model.addAttribute("endPageNum", endPageNum);
        model.addAttribute("select", num);
        model.addAttribute("num", num);
        model.addAttribute("start", start);
        model.addAttribute("end", end);
        model.addAttribute("content", content);
        

        model.addAttribute("listView", announcementDetailDto);


     
        return "announcement/list";
    }

    @GetMapping("announcement/{id}")
    public String detail(@PathVariable int id, Model model) {
        Boolean isSubscribe = false;

        Employee principal = (Employee) session.getAttribute("principal");
        if (principal != null) {
            model.addAttribute("resumes", resumeRepository.findByEmployeeId(principal.getId()));
            Subscribe check = subscribeRepository.findByEmployeeIdAndAnnouncementId(principal.getId(), id);
            
            if (check != null) {
                isSubscribe = true;
            }
        }
        int stackId = announcementRepository.findAnnouncementAndCompanyId(id).getStackId();

        model.addAttribute("announcement", announcementRepository.findAnnouncementAndCompanyId(id));
        model.addAttribute("tostack", stackMasterRepository.findById(stackId));
        model.addAttribute("company", companyRepository.findById(id));
        model.addAttribute("isSubscribe", isSubscribe);
        model.addAttribute("count", subscribeRepository.findByAnnouncementIdCount(id));

        return "announcement/detail";
    }

    @GetMapping("announcement/saveForm")
    public String saveForm(Model model) {
        Company comPrincipal = (Company) session.getAttribute("comPrincipal");
        if (comPrincipal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
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
