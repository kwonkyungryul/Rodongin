package shop.mtcoding.rodongin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import shop.mtcoding.rodongin.dto.ResponseDto;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.model.employee.Employee;
import shop.mtcoding.rodongin.model.subscribe.SubscribeRepository;
import shop.mtcoding.rodongin.service.subscribe.SubscribeService;

@Controller
public class SubscribeController {

    @Autowired
    private HttpSession session;

    @Autowired
    private SubscribeService subscribeService;

    @Autowired
    private SubscribeRepository subscribeRepository;
    
    @PostMapping("/subscribe")
    public ResponseEntity<?> save(@RequestBody Integer announcementId) {

        Employee principal = (Employee) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }

        if (announcementId == null) {
            throw new CustomApiException("비정상적인 접근입니다.");
        }

        subscribeService.구독하기(principal.getId(), announcementId);
        

        return new ResponseEntity<>(new ResponseDto<>(1, "구독 성공", subscribeRepository.findByAllCount().toString()), HttpStatus.CREATED);
    }

    @DeleteMapping("/subscribe")
    public ResponseEntity<?> delete(@RequestBody Integer announcementId){
        Employee principal = (Employee) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }

        if (announcementId == null) {
            throw new CustomApiException("비정상적인 접근입니다.");
        }

        subscribeService.구독취소(principal.getId(), announcementId);
        return new ResponseEntity<>(new ResponseDto<>(1, "구독 취소", subscribeRepository.findByAllCount().toString()), HttpStatus.OK);
    }
}
