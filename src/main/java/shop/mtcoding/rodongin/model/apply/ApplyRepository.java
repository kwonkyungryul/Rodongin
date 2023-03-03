package shop.mtcoding.rodongin.model.apply;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ApplyRepository {
    public int insert(@Param("announcementId") int announcementId, @Param("resumeId") int resumeId);
}
