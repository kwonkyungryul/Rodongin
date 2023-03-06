package shop.mtcoding.rodongin.service.subscribe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.mtcoding.rodongin.model.subscribe.SubscribeRepository;

@Service
public class SubscribeService {
    
    @Autowired
    private SubscribeRepository subscribeRepository;

    // public void 구독하기() {


    //     subscribeRepository.insert(subscribe);
    // }
}
