package com.rabbiter.cm.domain;

import java.io.Serializable;
import java.util.Objects;

/**
 * 当前登录用户
 */
public class LoginUser implements Serializable {
    //登录的用户信息
    private SysUser sysUser;
    //用户管理的影院id
    private Long cinemaId;
    //用户管理的影院名称
    private String cinemaName;

    //系统颁发的token
    private String token;

    public LoginUser() {
    }

    public LoginUser(SysUser sysUser, Long cinemaId, String cinemaName, String token) {
        this.sysUser = sysUser;
        this.cinemaId = cinemaId;
        this.cinemaName = cinemaName;
        this.token = token;
    }

    @Override
    public String toString() {
        return "LoginUser{" +
                "sysUser=" + sysUser +
                ", cinemaId=" + cinemaId +
                ", cinemaName='" + cinemaName + '\'' +
                ", token='" + token + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LoginUser loginUser = (LoginUser) o;
        return Objects.equals(sysUser, loginUser.sysUser) && Objects.equals(cinemaId, loginUser.cinemaId) && Objects.equals(cinemaName, loginUser.cinemaName) && Objects.equals(token, loginUser.token);
    }

    @Override
    public int hashCode() {
        return Objects.hash(sysUser, cinemaId, cinemaName, token);
    }

    public SysUser getSysUser() {
        return sysUser;
    }

    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    public Long getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(Long cinemaId) {
        this.cinemaId = cinemaId;
    }

    public String getCinemaName() {
        return cinemaName;
    }

    public void setCinemaName(String cinemaName) {
        this.cinemaName = cinemaName;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
