package com.rabbiter.cm.mapper;

import com.rabbiter.cm.domain.SysMovieCategory;
import com.rabbiter.cm.domain.SysMovieToCategory;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysMovieCategoryMapper {

    List<SysMovieCategory> findAllCategorys();

    SysMovieCategory findCategoryById(Long id);

    List<SysMovieCategory> findOneMovieCategorys(Long id);

    int addCategory(SysMovieCategory sysMovieCategory);

    int updateCategory(SysMovieCategory sysMovieCategory);

    int deleteCategory(Long id);

    int addMovieToCategory(SysMovieToCategory sysMovieToCategory);

    int deleteMovieToCategory(SysMovieToCategory sysMovieToCategory);

}
