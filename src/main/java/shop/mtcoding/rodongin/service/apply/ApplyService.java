package shop.mtcoding.rodongin.service.apply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.announcement.Announcement;
import shop.mtcoding.rodongin.model.announcement.AnnouncementRepository;
import shop.mtcoding.rodongin.model.apply.ApplyRepository;
import shop.mtcoding.rodongin.model.resume.Resume;
import shop.mtcoding.rodongin.model.resume.ResumeRepository;

@Service
public class ApplyService {

    @Autowired
    private AnnouncementRepository announcementRepository;

    @Autowired
    private ResumeRepository resumeRepository;

    @Autowired
    private ApplyRepository applyRepository;

    // 지원할때 이력서의 id랑 공고의id가 인서트되어야 함.

    @Transactional
    public void 지원하기(int announcementId, int resumeId) {

        Announcement announcement = announcementRepository.findById(announcementId);
        Resume resume = resumeRepository.findById(resumeId);

        if (announcement == null) {
            throw new CustomException("존재하지 않는 공고입니다.");
        }
        if (resume == null) {
            throw new CustomException("존재하지 않는 이력서입니다.");
        }

        try {
            applyRepository.insert(announcementId, resumeId);
        } catch (Exception e) {
            // log.error("서버에러"+e.getMessage());
            throw new CustomException("서버에러", HttpStatus.INTERNAL_SERVER_ERROR);

        }

    }

}
