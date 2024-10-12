package com.rabbiter.cm.service;

import com.rabbiter.cm.domain.SysMovie;
import com.rabbiter.cm.domain.vo.SysMovieVo;

import java.util.List;


public interface SysMovieService {

    List<SysMovie> findAllMovies(SysMovieVo sysMovieVo);

    SysMovie findMovieById(Long id);

    SysMovie findOneMovie(Long id);

    int addMovie(SysMovie sysMovie);

    int updateMovie(SysMovie sysMovie);

    int deleteMovie(Long[] ids);

    //获取单个影院上映的所有电影信息
//    List<SysMovie> findByCinemaId(Long id);


    //获取各种榜单
    List<SysMovie> totalBoxOfficeList();

    List<SysMovie> domesticBoxOfficeList();

    List<SysMovie> foreignBoxOfficeList();

}
