package com.rabbiter.cm.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.time.LocalDate;

public class SysSessionVo implements Serializable {

    private Long hallId;

    private Long movieId;

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd")
    private LocalDate sessionDate;

    public SysSessionVo() {
    }

    public SysSessionVo(Long hallId, Long movieId, LocalDate sessionDate) {
        this.hallId = hallId;
        this.movieId = movieId;
        this.sessionDate = sessionDate;
    }

    public Long getHallId() {
        return hallId;
    }

    public void setHallId(Long hallId) {
        this.hallId = hallId;
    }

    public Long getMovieId() {
        return movieId;
    }

    public void setMovieId(Long movieId) {
        this.movieId = movieId;
    }

    public LocalDate getSessionDate() {
        return sessionDate;
    }

    public void setSessionDate(LocalDate sessionDate) {
        this.sessionDate = sessionDate;
    }

    @Override
    public String toString() {
        return "SysSessionVo{" +
                "hallId=" + hallId +
                ", movieId=" + movieId +
                ", sessionDate=" + sessionDate +
                '}';
    }
}
