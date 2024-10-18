package com.rabbiter.cm.mapper;

import com.rabbiter.cm.domain.SysCinema;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SysCinemaMapper {

    SysCinema findCinema();

    int updateCinema(SysCinema sysCinema);

    // 前台展示单个影院信息，返回包含影院、上映中的所有电影信息
    SysCinema findCinemaById(Long id);

}
