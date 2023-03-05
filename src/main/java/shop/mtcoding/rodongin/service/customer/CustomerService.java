package shop.mtcoding.rodongin.service.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.rodongin.dto.customer.CustomerReq.CustomerSaveReqDto;
import shop.mtcoding.rodongin.handler.ex.CustomException;
import shop.mtcoding.rodongin.model.customer.CustomerRepository;

@Transactional(readOnly = true)
@Service
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Transactional
    public void 글쓰기(CustomerSaveReqDto customerSaveReqDto, Integer employeeId) {
        int result = customerRepository.insert(customerSaveReqDto.getCustomerTitle(),
                customerSaveReqDto.getCustomerContent(), employeeId);
        if (result != 1) {
            throw new CustomException("글쓰기 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
