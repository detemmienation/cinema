package com.rabbiter.cm.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.List;
import java.util.Objects;

public class SysCinema implements Serializable {
    private final static Long serialVersionUID = 1L;

    private Long cinemaId;

    @NotBlank(message = "影院名称不能为空")
    private String cinemaName;

    private String hallCategoryList;

    private String cinemaPicture;

    private String cinemaAddress;

    private String cinemaPhone;

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "HH:mm")
    private String workStartTime;

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "HH:mm")
    private String workEndTime;

    //当前影院上映的所有电影，规则：上映的电影指包括今天在内，未来5天有安排目标影片的场次
    private List<SysMovie> sysMovieList;

    public SysCinema() {
    }

    public SysCinema(Long cinemaId, String cinemaName, String hallCategoryList, String cinemaPicture, String cinemaAddress, String cinemaPhone, String workStartTime, String workEndTime, List<SysMovie> sysMovieList) {
        this.cinemaId = cinemaId;
        this.cinemaName = cinemaName;
        this.hallCategoryList = hallCategoryList;
        this.cinemaPicture = cinemaPicture;
        this.cinemaAddress = cinemaAddress;
        this.cinemaPhone = cinemaPhone;
        this.workStartTime = workStartTime;
        this.workEndTime = workEndTime;
        this.sysMovieList = sysMovieList;
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

    public String getHallCategoryList() {
        return hallCategoryList;
    }

    public void setHallCategoryList(String hallCategoryList) {
        this.hallCategoryList = hallCategoryList;
    }

    public String getCinemaPicture() {
        return cinemaPicture;
    }

    public void setCinemaPicture(String cinemaPicture) {
        this.cinemaPicture = cinemaPicture;
    }

    public String getCinemaAddress() {
        return cinemaAddress;
    }

    public void setCinemaAddress(String cinemaAddress) {
        this.cinemaAddress = cinemaAddress;
    }

    public String getCinemaPhone() {
        return cinemaPhone;
    }

    public void setCinemaPhone(String cinemaPhone) {
        this.cinemaPhone = cinemaPhone;
    }

    public String getWorkStartTime() {
        return workStartTime;
    }

    public void setWorkStartTime(String workStartTime) {
        this.workStartTime = workStartTime;
    }

    public String getWorkEndTime() {
        return workEndTime;
    }

    public void setWorkEndTime(String workEndTime) {
        this.workEndTime = workEndTime;
    }

    public List<SysMovie> getSysMovieList() {
        return sysMovieList;
    }

    public void setSysMovieList(List<SysMovie> sysMovieList) {
        this.sysMovieList = sysMovieList;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SysCinema sysCinema = (SysCinema) o;
        return Objects.equals(cinemaId, sysCinema.cinemaId) && Objects.equals(cinemaName, sysCinema.cinemaName) && Objects.equals(hallCategoryList, sysCinema.hallCategoryList) && Objects.equals(cinemaPicture, sysCinema.cinemaPicture) && Objects.equals(cinemaAddress, sysCinema.cinemaAddress) && Objects.equals(cinemaPhone, sysCinema.cinemaPhone) && Objects.equals(workStartTime, sysCinema.workStartTime) && Objects.equals(workEndTime, sysCinema.workEndTime) && Objects.equals(sysMovieList, sysCinema.sysMovieList);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cinemaId, cinemaName, hallCategoryList, cinemaPicture, cinemaAddress, cinemaPhone, workStartTime, workEndTime, sysMovieList);
    }

    @Override
    public String toString() {
        return "SysCinema{" +
                "cinemaId=" + cinemaId +
                ", cinemaName='" + cinemaName + '\'' +
                ", hallCategoryList='" + hallCategoryList + '\'' +
                ", cinemaPicture='" + cinemaPicture + '\'' +
                ", cinemaAddress='" + cinemaAddress + '\'' +
                ", cinemaPhone='" + cinemaPhone + '\'' +
                ", workStartTime='" + workStartTime + '\'' +
                ", workEndTime='" + workEndTime + '\'' +
                ", sysMovieList=" + sysMovieList +
                '}';
    }
}
