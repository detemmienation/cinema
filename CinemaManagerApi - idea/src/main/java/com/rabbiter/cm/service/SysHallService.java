package com.rabbiter.cm.service;

import com.rabbiter.cm.domain.SysHall;

import java.util.List;


public interface SysHallService {
    List<SysHall> findAllHalls(SysHall sysHall);

    SysHall findHallById(SysHall sysHall);

    int addHall(SysHall sysHall);

    int updateHall(SysHall sysHall);

    int deleteHall(SysHall[] sysHall);
}
