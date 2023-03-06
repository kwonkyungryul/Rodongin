package shop.mtcoding.rodongin.service.subscribe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.model.employee.Employee;
import shop.mtcoding.rodongin.model.employee.EmployeeRepository;
import shop.mtcoding.rodongin.model.subscribe.SubscribeRepository;

@Service
public class SubscribeService {
    
    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private SubscribeRepository subscribeRepository;

    public void 구독하기(Integer principalId, Integer announcementId) {
        Employee principal = employeeRepository.findById(principalId);

        if(principal == null) {
            throw new CustomApiException("잘못된 요청입니다.");
        }
        
        try {
            subscribeRepository.insert(principalId, announcementId);

        } catch(Exception e) {
            throw new CustomApiException("일시적인 서버 에러입니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public void 구독취소(Integer principalId, Integer announcementId) {
        Employee principal = employeeRepository.findById(principalId);

        if(principal == null) {
            throw new CustomApiException("잘못된 요청입니다.");
        }

        try {
            subscribeRepository.deleteByEmployeeIdAndAnnouncementId(principalId, announcementId);

        } catch(Exception e) {
            throw new CustomApiException("일시적인 서버 에러입니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
