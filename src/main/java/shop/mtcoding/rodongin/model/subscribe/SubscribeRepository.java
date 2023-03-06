package shop.mtcoding.rodongin.model.subscribe;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SubscribeRepository {
    public int insert(Subscribe subscribe);
}
