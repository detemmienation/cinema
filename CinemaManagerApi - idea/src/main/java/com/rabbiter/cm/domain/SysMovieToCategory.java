package com.rabbiter.cm.domain;

import java.io.Serializable;
import java.util.Objects;

/**
 * 存储电影与电影类别的多对多联系
 */
public class SysMovieToCategory implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Long movieId;

    private Long movieCategoryId;


    public SysMovieToCategory() {
    }

    public SysMovieToCategory(Long movieId, Long movieCategoryId) {
        this.movieId = movieId;
        this.movieCategoryId = movieCategoryId;
    }

    public Long getMovieId() {
        return movieId;
    }

    public void setMovieId(Long movieId) {
        this.movieId = movieId;
    }

    public Long getMovieCategoryId() {
        return movieCategoryId;
    }

    public void setMovieCategoryId(Long movieCategoryId) {
        this.movieCategoryId = movieCategoryId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SysMovieToCategory that = (SysMovieToCategory) o;
        return Objects.equals(movieId, that.movieId) && Objects.equals(movieCategoryId, that.movieCategoryId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(movieId, movieCategoryId);
    }

    @Override
    public String toString() {
        return "SysMovieToCategory{" +
                "movieId=" + movieId +
                ", movieCategoryId=" + movieCategoryId +
                '}';
    }
}
