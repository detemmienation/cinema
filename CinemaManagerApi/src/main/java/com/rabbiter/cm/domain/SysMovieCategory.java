package com.rabbiter.cm.domain;


import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Objects;

public class SysMovieCategory implements Serializable {
    //序列号
    private static final long serialVersionUID = 1L;
    //电影分类id
    private Long movieCategoryId;
    //电影分类名称
    @NotBlank(message = "电影分类名称不能为空")
    private String movieCategoryName;

    public SysMovieCategory() {
    }

    public SysMovieCategory(Long movieCategoryId, String movieCategoryName) {
        this.movieCategoryId = movieCategoryId;
        this.movieCategoryName = movieCategoryName;
    }

    public Long getMovieCategoryId() {
        return movieCategoryId;
    }

    public void setMovieCategoryId(Long movieCategoryId) {
        this.movieCategoryId = movieCategoryId;
    }

    public String getMovieCategoryName() {
        return movieCategoryName;
    }

    public void setMovieCategoryName(String movieCategoryName) {
        this.movieCategoryName = movieCategoryName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SysMovieCategory that = (SysMovieCategory) o;
        return Objects.equals(movieCategoryId, that.movieCategoryId) && Objects.equals(movieCategoryName, that.movieCategoryName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(movieCategoryId, movieCategoryName);
    }

    @Override
    public String toString() {
        return "SysMovieCategory{" +
                "movieCategoryId=" + movieCategoryId +
                ", movieCategoryName='" + movieCategoryName + '\'' +
                '}';
    }
}
