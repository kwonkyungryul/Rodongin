package shop.mtcoding.rodongin.service.announcement;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.rodongin.dto.announcement.AnnouncementReq.AnnouncementSaveReqDto;
import shop.mtcoding.rodongin.dto.announcement.AnnouncementReq.AnnouncementUpdateReqDto;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.model.announcement.Announcement;
import shop.mtcoding.rodongin.model.announcement.AnnouncementRepository;

@Service
public class AnnouncementService {

    @Autowired
    private HttpSession session;

    @Autowired
    private AnnouncementRepository announcementRepository;

    @Transactional
    public void 공고등록(AnnouncementSaveReqDto announcementSaveReqDto, int principalId) {

        int result = announcementRepository.insert(
                principalId,
                announcementSaveReqDto.getStackId(),
                announcementSaveReqDto.getAnnouncementTitle(),
                announcementSaveReqDto.getAnnouncementContent(),
                announcementSaveReqDto.getAnnouncementCarrer(),
                announcementSaveReqDto.getAnnouncementHireType(),
                announcementSaveReqDto.getAnnouncementRecNum(),
                announcementSaveReqDto.getAnnouncementSalary(),
                announcementSaveReqDto.getAnnouncementArea());

        if (result != 1) {
            throw new CustomApiException("게시글작성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    @Transactional
    public void 게시글삭제(int id, int companyId) {
        Announcement announcementPS = announcementRepository.findById(id);
        if (announcementPS == null) {
            throw new CustomApiException("없는 게시글을 삭제할 수 없소이다.");
        }
        if (announcementPS.getCompanyId() != companyId) {
            throw new CustomApiException("당신 회사의 글이 아니올시다.");
        }

        try {
            announcementRepository.deleteById(id);
        } catch (Exception e) {
            throw new CustomApiException("미안하오 서버에 문제가 있소");
        }

    }

    @Transactional
    public void 게시글수정(int id, AnnouncementUpdateReqDto announcementUpdateReqDto, int principalId) {

        Announcement announcementPS = announcementRepository.findById(id);
        if (announcementPS == null) {
            throw new CustomApiException("해당 게시글을 찾을 수 없당.");
        }
        if (announcementPS.getCompanyId() != principalId) {
            throw new CustomApiException("게시글을 수정할 권한이 없습니다.", HttpStatus.FORBIDDEN);
        }

        int result = announcementRepository.updateById(
                announcementUpdateReqDto, id);

        if (result != 1) {

            throw new CustomApiException("게시글을 수정에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}