package com.rabbiter.cm.domain;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.List;
import java.util.Objects;

public class SysResource implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Long id;

    @NotBlank(message = "菜单名称不能为空")
    private String name;

    private String path;

    //菜单权限等级
    private Integer level;

    private Long parentId;

    //父菜单
    private SysResource parent;

    //子菜单
    private List<SysResource> children;

    public SysResource() {
    }

    public SysResource(Long id, String name, String path, Integer level, Long parentId, SysResource parent, List<SysResource> children) {
        this.id = id;
        this.name = name;
        this.path = path;
        this.level = level;
        this.parentId = parentId;
        this.parent = parent;
        this.children = children;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public SysResource getParent() {
        return parent;
    }

    public void setParent(SysResource parent) {
        this.parent = parent;
    }

    public List<SysResource> getChildren() {
        return children;
    }

    public void setChildren(List<SysResource> children) {
        this.children = children;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SysResource that = (SysResource) o;
        return Objects.equals(id, that.id) && Objects.equals(name, that.name) && Objects.equals(path, that.path) && Objects.equals(level, that.level) && Objects.equals(parentId, that.parentId) && Objects.equals(parent, that.parent) && Objects.equals(children, that.children);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, path, level, parentId, parent, children);
    }

    @Override
    public String toString() {
        return "SysResource{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", path='" + path + '\'' +
                ", level=" + level +
                ", parentId=" + parentId +
                ", parent=" + parent +
                ", children=" + children +
                '}';
    }
}
