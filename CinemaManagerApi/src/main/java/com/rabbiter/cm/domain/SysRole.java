package com.rabbiter.cm.domain;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.List;
import java.util.Objects;

public class SysRole implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Long roleId;

    //角色名称
    @NotBlank(message = "角色名称不能为空")
    private String roleName;

    //角色描述
    @NotBlank(message = "角色描述不能为空")
    private String roleDesc;


    //角色拥有的权限，分多级权限存储，取名为children方便读取所有权限
    private List<SysResource> children;

    public SysRole() {
    }

    public SysRole(Long roleId, String roleName, String roleDesc, List<SysResource> children) {
        this.roleId = roleId;
        this.roleName = roleName;
        this.roleDesc = roleDesc;
        this.children = children;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
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
        SysRole sysRole = (SysRole) o;
        return Objects.equals(roleId, sysRole.roleId) && Objects.equals(roleName, sysRole.roleName) && Objects.equals(roleDesc, sysRole.roleDesc) && Objects.equals(children, sysRole.children);
    }

    @Override
    public int hashCode() {
        return Objects.hash(roleId, roleName, roleDesc, children);
    }

    @Override
    public String toString() {
        return "SysRole{" +
                "roleId=" + roleId +
                ", roleName='" + roleName + '\'' +
                ", roleDesc='" + roleDesc + '\'' +
                ", children=" + children +
                '}';
    }
}
