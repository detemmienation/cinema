package com.rabbiter.cm.mapper;

import com.rabbiter.cm.domain.SysResource;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysResourceMapper {

    /**
     * 查询所有并包含其父菜单
     *
     * @return
     */
    List<SysResource> findAllResources();

    /**
     * 查出所有菜单并包含其直接children
     *
     * @return
     */
    List<SysResource> findWithChildren();

    /**
     * 查询所有按父子关系的权限
     *
     * @return
     */
    List<SysResource> findAllWithAllChildren();

    SysResource findResourceById(Long id);

    int addResource(SysResource sysResource);

    int updateResource(SysResource sysResource);

    int deleteResource(Long id);

}
