package shop.mtcoding.rodongin.service.announcement;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.rodongin.dto.announcement.AnnouncementReq.AnnouncementSaveReqDto;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.model.announcement.AnnouncementRepository;

@Service
public class AnnouncementService {
    
    @Autowired
    private HttpSession session;

    @Autowired
    private AnnouncementRepository announcementRepository;

    @Transactional
    public void 공고등록(AnnouncementSaveReqDto announcementSaveReqDto, int principalId){
     
        int result = announcementRepository.insert(
            principalId, 
        announcementSaveReqDto.getStackId(),
        announcementSaveReqDto.getAnnouncementTitle(),
        announcementSaveReqDto.getAnnouncementContent(),
        announcementSaveReqDto.getAnnouncementCarrer(),
        announcementSaveReqDto.getAnnouncementHireType(),
        announcementSaveReqDto.getAnnouncementRecNum(),
        announcementSaveReqDto.getAnnouncementSalary(),
        announcementSaveReqDto.getAnnouncementArea()
        );
        

         if(result != 1){
            throw new CustomApiException("게시글작성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
  
    
    }

}
