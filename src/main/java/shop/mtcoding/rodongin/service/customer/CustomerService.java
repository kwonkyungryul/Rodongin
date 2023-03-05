package shop.mtcoding.rodongin.service.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.rodongin.dto.customer.CustomerReq.CustomerSaveReqDto;
import shop.mtcoding.rodongin.model.customer.CustomerRepository;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Transactional
    public void 글쓰기(CustomerSaveReqDto customerSaveReqDto, Integer employeeId) {
        int result = customerRepository.insert(customerSaveReqDto.getCustomerTitle(),
                customerSaveReqDto.getCustomerContent(), employeeId);

    }
}
