package com.rabbiter.cm.domain.vo;

import com.rabbiter.cm.domain.SysBill;

import java.io.Serializable;

/**
 * 接收前端增加订单的数据
 */
public class SysBillVo implements Serializable {

    //订单信息
    private SysBill sysBill;

    //若成功更新后场次的座位信息
    private String sessionSeats;

    public SysBillVo() {
    }

    public SysBillVo(SysBill sysBill, String sessionSeats) {
        this.sysBill = sysBill;
        this.sessionSeats = sessionSeats;
    }

    public SysBill getSysBill() {
        return sysBill;
    }

    public void setSysBill(SysBill sysBill) {
        this.sysBill = sysBill;
    }

    public String getSessionSeats() {
        return sessionSeats;
    }

    public void setSessionSeats(String sessionSeats) {
        this.sessionSeats = sessionSeats;
    }

    @Override
    public String toString() {
        return "SysBillVo{" +
                "sysBill=" + sysBill +
                ", sessionSeats='" + sessionSeats + '\'' +
                '}';
    }
}
