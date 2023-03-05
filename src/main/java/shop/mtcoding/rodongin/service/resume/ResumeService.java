package shop.mtcoding.rodongin.service.resume;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeSaveDto;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.model.resume.Resume;
import shop.mtcoding.rodongin.model.resume.ResumeCareerRepository;
import shop.mtcoding.rodongin.model.resume.ResumeGraduateRepository;
import shop.mtcoding.rodongin.model.resume.ResumeLicenseRepository;
import shop.mtcoding.rodongin.model.resume.ResumeRepository;
import shop.mtcoding.rodongin.model.resume.ResumeStackRepository;

@Service
public class ResumeService {

    @Autowired
    private ResumeRepository resumeRepository;
    @Autowired
    private ResumeGraduateRepository resumeGraduateRepository;
    @Autowired
    private ResumeCareerRepository resumeCareerRepository;
    @Autowired
    private ResumeLicenseRepository resumeLicenseRepository;
    @Autowired
    private ResumeStackRepository resumeStackRepository;
    
    @Transactional
    public void delete(int resumeId, Integer principalId) {
        Resume ResumePS = resumeRepository.findById(resumeId);
        if (ResumePS == null) {
            throw new CustomApiException("이력서가 존재하지 않습니다");
        }
        if (ResumePS.getEmployeeId() != principalId) {
            throw new CustomApiException("이력서를 삭제할 권한이 없습니다", HttpStatus.FORBIDDEN);
        }
        try {
            resumeRepository.deleteById(resumeId);
        } catch (Exception e) {
            throw new CustomApiException("이력서 삭제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
     @Transactional
    public void 이력서등록(ResumeSaveDto resumeSaveDto, int employeeId) {

        try {
            resumeRepository.insert(employeeId, resumeSaveDto);
            resumeGraduateRepository.insert(resumeSaveDto.getId(), resumeSaveDto.getSchoolId(),resumeSaveDto.getSchoolGraduate());
            resumeCareerRepository.insert(resumeSaveDto.getId(), resumeSaveDto.getCareerCompany(),resumeSaveDto.getCareerStart(),resumeSaveDto.getCareerEnd());
            resumeLicenseRepository.insert(resumeSaveDto.getId(), resumeSaveDto.getLicenseId(),resumeSaveDto.getLicenseIssuer());
            resumeStackRepository.insert(resumeSaveDto.getId(), resumeSaveDto.getStackId(),resumeSaveDto.getStackAcquisition());

        } catch (Exception e) {
            throw new CustomApiException("이력서 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
