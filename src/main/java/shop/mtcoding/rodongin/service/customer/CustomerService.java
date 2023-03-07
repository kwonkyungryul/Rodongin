package shop.mtcoding.rodongin.service.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.rodongin.dto.customer.CustomerReq.CustomerSaveReqDto;
import shop.mtcoding.rodongin.dto.customer.CustomerReq.CustomerUpdateReqDto;
import shop.mtcoding.rodongin.handler.ex.CustomApiException;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.customer.Customer;
import shop.mtcoding.rodongin.model.customer.CustomerRepository;

@Transactional(readOnly = true)
@Service
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Transactional
    public void 글수정(int id, int principalId, CustomerUpdateReqDto customerUpdateReqDto) {
        Customer customerPS = customerRepository.findById(id);
        if (customerPS == null) {
            throw new CustomApiException("글이 존재 하지않아 수정이 불가합니다.");
        }
        if (customerPS.getEmployeeId() != principalId) {
            throw new CustomApiException("게시물의 수정 권한이 없습니다.", HttpStatus.FORBIDDEN);
        }

    }

    @Transactional
    public void 글쓰기(CustomerSaveReqDto customerSaveReqDto, Integer employeeId) {

        int result = customerRepository.insert(
                customerSaveReqDto.getCustomerTitle(),
                customerSaveReqDto.getCustomerContent(),
                employeeId);
        if (result != 1) {
            throw new CustomException("글쓰기 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Transactional
    public void 게시글삭제(int id, int employeeId) {
        Customer customerPS = customerRepository.findById(id);
        if (customerPS == null) {
            throw new CustomApiException("없는 게시글을 삭제할 수 없습니다");
        }
        if (customerPS.getEmployeeId() != employeeId) { // 만약에 오류나면 이쪽..
            throw new CustomApiException("해당 게시글을 삭제할 권한이 없습니다", HttpStatus.FORBIDDEN);
        }

        try {
            customerRepository.deleteById(id);
        } catch (Exception e) {
            throw new CustomApiException("서버에 일시적인 문제가 생겼습니다", HttpStatus.INTERNAL_SERVER_ERROR);
            // 로그를 남겨야 함 (DB or File)
        }

    }
}
