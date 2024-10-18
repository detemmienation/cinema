package com.rabbiter.cm.domain;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Objects;

public class SysHall implements Serializable {
    private final static Long serialVersionUID = 1L;

    private Long cinemaId;

    private Long hallId;

    @NotBlank(message = "影厅名称不能为空")
    private String hallName;

    private String hallCategory;

    //排开始标号：'1' / 'A' 等
    private String rowStart;

    //影厅排数
    @Min(value = 3, message = "排数不能小于3")
    @Max(value = 50, message = "排数不能大于50")
    private Integer rowNums;

    //每排座位数
    @Min(value = 3, message = "每排座位数不能小于3")
    @Max(value = 50, message = "每排座位数不能大于50")
    private Integer seatNumsRow;

    //总可用座位数，可以通过安排座位禁用指定座位
    @Min(value = 9, message = "座位数不能小于9")
    @Max(value = 2500, message = "座位数不能大于2500")
    private Integer seatNums;

    //座位的状态，使用json存储每个座位的状态，0表示可用，2表示禁用(1表示售出，在场次表中统计)
    private String seatState;

    private Boolean delState;

    //影厅表的多表连接
    private SysCinema sysCinema;

    public SysHall() {
    }

    public SysHall(Long cinemaId, Long hallId, String hallName, String hallCategory, String rowStart, Integer rowNums, Integer seatNumsRow, Integer seatNums, String seatState, Boolean delState, SysCinema sysCinema) {
        this.cinemaId = cinemaId;
        this.hallId = hallId;
        this.hallName = hallName;
        this.hallCategory = hallCategory;
        this.rowStart = rowStart;
        this.rowNums = rowNums;
        this.seatNumsRow = seatNumsRow;
        this.seatNums = seatNums;
        this.seatState = seatState;
        this.delState = delState;
        this.sysCinema = sysCinema;
    }

    public Long getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(Long cinemaId) {
        this.cinemaId = cinemaId;
    }

    public Long getHallId() {
        return hallId;
    }

    public void setHallId(Long hallId) {
        this.hallId = hallId;
    }

    public String getHallName() {
        return hallName;
    }

    public void setHallName(String hallName) {
        this.hallName = hallName;
    }

    public String getHallCategory() {
        return hallCategory;
    }

    public void setHallCategory(String hallCategory) {
        this.hallCategory = hallCategory;
    }

    public String getRowStart() {
        return rowStart;
    }

    public void setRowStart(String rowStart) {
        this.rowStart = rowStart;
    }

    public Integer getRowNums() {
        return rowNums;
    }

    public void setRowNums(Integer rowNums) {
        this.rowNums = rowNums;
    }

    public Integer getSeatNumsRow() {
        return seatNumsRow;
    }

    public void setSeatNumsRow(Integer seatNumsRow) {
        this.seatNumsRow = seatNumsRow;
    }

    public Integer getSeatNums() {
        return seatNums;
    }

    public void setSeatNums(Integer seatNums) {
        this.seatNums = seatNums;
    }

    public String getSeatState() {
        return seatState;
    }

    public void setSeatState(String seatState) {
        this.seatState = seatState;
    }

    public Boolean getDelState() {
        return delState;
    }

    public void setDelState(Boolean delState) {
        this.delState = delState;
    }

    public SysCinema getSysCinema() {
        return sysCinema;
    }

    public void setSysCinema(SysCinema sysCinema) {
        this.sysCinema = sysCinema;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SysHall sysHall = (SysHall) o;
        return Objects.equals(cinemaId, sysHall.cinemaId) && Objects.equals(hallId, sysHall.hallId) && Objects.equals(hallName, sysHall.hallName) && Objects.equals(hallCategory, sysHall.hallCategory) && Objects.equals(rowStart, sysHall.rowStart) && Objects.equals(rowNums, sysHall.rowNums) && Objects.equals(seatNumsRow, sysHall.seatNumsRow) && Objects.equals(seatNums, sysHall.seatNums) && Objects.equals(seatState, sysHall.seatState) && Objects.equals(delState, sysHall.delState) && Objects.equals(sysCinema, sysHall.sysCinema);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cinemaId, hallId, hallName, hallCategory, rowStart, rowNums, seatNumsRow, seatNums, seatState, delState, sysCinema);
    }

    @Override
    public String toString() {
        return "SysHall{" +
                "cinemaId=" + cinemaId +
                ", hallId=" + hallId +
                ", hallName='" + hallName + '\'' +
                ", hallCategory='" + hallCategory + '\'' +
                ", rowStart='" + rowStart + '\'' +
                ", rowNums=" + rowNums +
                ", seatNumsRow=" + seatNumsRow +
                ", seatNums=" + seatNums +
                ", seatState='" + seatState + '\'' +
                ", delState=" + delState +
                ", sysCinema=" + sysCinema +
                '}';
    }
}
