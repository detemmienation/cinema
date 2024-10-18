package com.rabbiter.cm.domain.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 * 封装电影查询的条件
 */
public class SysMovieVo implements Serializable {

    private String movieName;

    private String movieArea;

    private Long movieCategoryId;

    private Date startDate;

    private Date endDate;

    public SysMovieVo() {
    }

    public SysMovieVo(String movieName, String movieArea, Long movieCategoryId, Date startDate, Date endDate) {
        this.movieName = movieName;
        this.movieArea = movieArea;
        this.movieCategoryId = movieCategoryId;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getMovieArea() {
        return movieArea;
    }

    public void setMovieArea(String movieArea) {
        this.movieArea = movieArea;
    }

    public Long getMovieCategoryId() {
        return movieCategoryId;
    }

    public void setMovieCategoryId(Long movieCategoryId) {
        this.movieCategoryId = movieCategoryId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SysMovieVo that = (SysMovieVo) o;
        return Objects.equals(movieName, that.movieName) && Objects.equals(movieArea, that.movieArea) && Objects.equals(movieCategoryId, that.movieCategoryId) && Objects.equals(startDate, that.startDate) && Objects.equals(endDate, that.endDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(movieName, movieArea, movieCategoryId, startDate, endDate);
    }

    @Override
    public String toString() {
        return "SysMovieVo{" +
                "movieName='" + movieName + '\'' +
                ", movieArea='" + movieArea + '\'' +
                ", movieCategoryId=" + movieCategoryId +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                '}';
    }
}
