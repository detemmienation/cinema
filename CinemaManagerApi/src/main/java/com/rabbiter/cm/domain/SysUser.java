package com.rabbiter.cm.domain;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.util.Objects;

public class SysUser implements Serializable {
    private final static Long serialVersionUID = 1L;
    //用户id
    private Long userId;
    //用户名
    @NotBlank(message = "用户名不能为空")
    private String userName;
    //密码
    @NotBlank(message = "密码不能为空")
    private String password;
    //盐
    private String salt;
    //邮箱
    @Email(message = "邮箱格式有误")
    private String email;
    //电话号码
    @Pattern(regexp = "^1[3|4|5|7|8]\\d{9}$", message = "电话号码格式有错")
    private String phoneNumber;
    //性别
    private Boolean sex;
    //用户头像
    private String userPicture;
    //用户对应的角色id，为简化操作，采用1对1
    private Long roleId;

    private String birthday;

    private String autograph;

    //用户的角色
    private SysRole sysRole;

    public SysUser() {
    }

    public SysUser(Long userId, String userName, String password, String salt, String email, String phoneNumber, Boolean sex, String userPicture, Long roleId, String birthday, String autograph, SysRole sysRole) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.salt = salt;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.sex = sex;
        this.userPicture = userPicture;
        this.roleId = roleId;
        this.birthday = birthday;
        this.autograph = autograph;
        this.sysRole = sysRole;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Boolean getSex() {
        return sex;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public String getUserPicture() {
        return userPicture;
    }

    public void setUserPicture(String userPicture) {
        this.userPicture = userPicture;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAutograph() {
        return autograph;
    }

    public void setAutograph(String autograph) {
        this.autograph = autograph;
    }

    public SysRole getSysRole() {
        return sysRole;
    }

    public void setSysRole(SysRole sysRole) {
        this.sysRole = sysRole;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SysUser sysUser = (SysUser) o;
        return Objects.equals(userId, sysUser.userId) && Objects.equals(userName, sysUser.userName) && Objects.equals(password, sysUser.password) && Objects.equals(salt, sysUser.salt) && Objects.equals(email, sysUser.email) && Objects.equals(phoneNumber, sysUser.phoneNumber) && Objects.equals(sex, sysUser.sex) && Objects.equals(userPicture, sysUser.userPicture) && Objects.equals(roleId, sysUser.roleId) && Objects.equals(birthday, sysUser.birthday) && Objects.equals(autograph, sysUser.autograph) && Objects.equals(sysRole, sysUser.sysRole);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, userName, password, salt, email, phoneNumber, sex, userPicture, roleId, birthday, autograph, sysRole);
    }

    @Override
    public String toString() {
        return "SysUser{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", salt='" + salt + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", sex=" + sex +
                ", userPicture='" + userPicture + '\'' +
                ", roleId=" + roleId +
                ", birthday='" + birthday + '\'' +
                ", autograph='" + autograph + '\'' +
                ", sysRole=" + sysRole +
                '}';
    }
}
