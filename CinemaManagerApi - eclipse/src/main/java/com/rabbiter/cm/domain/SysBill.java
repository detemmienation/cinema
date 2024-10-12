package com.rabbiter.cm.domain;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 * 订单实体类
 */
public class SysBill implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Long billId;

    //订单状态，0表示未支付，1表示已完成
    private Boolean payState;

    //下订单的用户id
    @NotNull(message = "下订单用户不能为空")
    private Long userId;

    //订单所属的场次
    @NotNull(message = "订单所属场次不能为空")
    private Long sessionId;

    //订单的座位，如：1排10号、A排5号
    @NotBlank(message = "订单所选座位不能为空")
    private String seats;

    private Boolean cancelState;

    private Boolean cancelRole;

    private Date createTime;

    private Date deadline;

    private Date cancelTime;

    // 用户名作模糊查询条件
    private String queryByUserName;

    // 管理员操作识别，及备注内容。管理员操作点单，或添加或修改，必须要填写备注信息，购票子系统不需要填写，并清空
    private String remark;
    // 删除状态，1：删除，0：未删除
    private Boolean delState;

    //多表连接
    private SysSession sysSession;

    private SysUser sysUser;

    public SysBill() {
    }

    public SysBill(Long billId, Boolean payState, Long userId, Long sessionId, String seats, Boolean cancelState, Boolean cancelRole, Date createTime, Date deadline, Date cancelTime, String queryByUserName, String remark, Boolean delState, SysSession sysSession, SysUser sysUser) {
        this.billId = billId;
        this.payState = payState;
        this.userId = userId;
        this.sessionId = sessionId;
        this.seats = seats;
        this.cancelState = cancelState;
        this.cancelRole = cancelRole;
        this.createTime = createTime;
        this.deadline = deadline;
        this.cancelTime = cancelTime;
        this.queryByUserName = queryByUserName;
        this.remark = remark;
        this.delState = delState;
        this.sysSession = sysSession;
        this.sysUser = sysUser;
    }

    public Long getBillId() {
        return billId;
    }

    public void setBillId(Long billId) {
        this.billId = billId;
    }

    public Boolean getPayState() {
        return payState;
    }

    public void setPayState(Boolean payState) {
        this.payState = payState;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getSessionId() {
        return sessionId;
    }

    public void setSessionId(Long sessionId) {
        this.sessionId = sessionId;
    }

    public String getSeats() {
        return seats;
    }

    public void setSeats(String seats) {
        this.seats = seats;
    }

    public Boolean getCancelState() {
        return cancelState;
    }

    public void setCancelState(Boolean cancelState) {
        this.cancelState = cancelState;
    }

    public Boolean getCancelRole() {
        return cancelRole;
    }

    public void setCancelRole(Boolean cancelRole) {
        this.cancelRole = cancelRole;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public Date getCancelTime() {
        return cancelTime;
    }

    public void setCancelTime(Date cancelTime) {
        this.cancelTime = cancelTime;
    }

    public String getQueryByUserName() {
        return queryByUserName;
    }

    public void setQueryByUserName(String queryByUserName) {
        this.queryByUserName = queryByUserName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Boolean getDelState() {
        return delState;
    }

    public void setDelState(Boolean delState) {
        this.delState = delState;
    }

    public SysSession getSysSession() {
        return sysSession;
    }

    public void setSysSession(SysSession sysSession) {
        this.sysSession = sysSession;
    }

    public SysUser getSysUser() {
        return sysUser;
    }

    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    @Override
    public String toString() {
        return "SysBill{" +
                "billId=" + billId +
                ", payState=" + payState +
                ", userId=" + userId +
                ", sessionId=" + sessionId +
                ", seats='" + seats + '\'' +
                ", cancelState=" + cancelState +
                ", cancelRole=" + cancelRole +
                ", createTime=" + createTime +
                ", deadline=" + deadline +
                ", cancelTime=" + cancelTime +
                ", queryByUserName='" + queryByUserName + '\'' +
                ", remark='" + remark + '\'' +
                ", delState=" + delState +
                ", sysSession=" + sysSession +
                ", sysUser=" + sysUser +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SysBill sysBill = (SysBill) o;
        return Objects.equals(billId, sysBill.billId) && Objects.equals(payState, sysBill.payState) && Objects.equals(userId, sysBill.userId) && Objects.equals(sessionId, sysBill.sessionId) && Objects.equals(seats, sysBill.seats) && Objects.equals(cancelState, sysBill.cancelState) && Objects.equals(cancelRole, sysBill.cancelRole) && Objects.equals(createTime, sysBill.createTime) && Objects.equals(deadline, sysBill.deadline) && Objects.equals(cancelTime, sysBill.cancelTime) && Objects.equals(queryByUserName, sysBill.queryByUserName) && Objects.equals(remark, sysBill.remark) && Objects.equals(delState, sysBill.delState) && Objects.equals(sysSession, sysBill.sysSession) && Objects.equals(sysUser, sysBill.sysUser);
    }

    @Override
    public int hashCode() {
        return Objects.hash(billId, payState, userId, sessionId, seats, cancelState, cancelRole, createTime, deadline, cancelTime, queryByUserName, remark, delState, sysSession, sysUser);
    }
}
