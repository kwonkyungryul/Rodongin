package shop.mtcoding.rodongin.service.resume;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeCareerSaveDto;
import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeGraduateSaveDto;
import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeLicenseSaveDto;
import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeSaveDto;
import shop.mtcoding.rodongin.dto.resume.ResumeReq.ResumeStackSaveDto;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.resume.Resume;
import shop.mtcoding.rodongin.model.resume.ResumeRepository;

@Service
public class ResumeService {

    @Autowired
    private ResumeRepository resumeRepository;
    
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
    public void 이력서등록(ResumeSaveDto resumeSaveDto,int employeeId) {
        // System.out.println(resumeSaveDto.getCV());
        // System.out.println(resumeSaveDto.getResumeSalary());
        // System.out.println(resumeSaveDto.getResumeTitle());
        try {
            resumeRepository.insert(employeeId, resumeSaveDto);
        } catch (Exception e) {
            throw new CustomApiException("이력서 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }    
        System.out.println(resumeSaveDto.getId());
    }
        
      
}

