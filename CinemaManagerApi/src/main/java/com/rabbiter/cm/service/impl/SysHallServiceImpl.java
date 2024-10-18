package com.rabbiter.cm.service.impl;

import com.rabbiter.cm.domain.SysHall;
import com.rabbiter.cm.mapper.SysHallMapper;
import com.rabbiter.cm.service.SysHallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class SysHallServiceImpl implements SysHallService {

    @Autowired
    private SysHallMapper sysHallMapper;

    @Override
    public List<SysHall> findAllHalls(SysHall sysHall) {
        return sysHallMapper.findAllHalls(sysHall);
    }

    @Override
    public SysHall findHallById(SysHall sysHall) {
        return sysHallMapper.findHallById(sysHall);
    }

    @Override
    public int addHall(SysHall sysHall) {
        return sysHallMapper.addHall(sysHall);
    }

    @Override
    public int updateHall(SysHall sysHall) {
        return sysHallMapper.updateHall(sysHall);
    }

    @Override
    public int deleteHall(SysHall[] sysHalls) {
        int rows = 0;
        for (SysHall sysHall : sysHalls) {
            rows += sysHallMapper.deleteHall(sysHall);
        }
        return rows;
    }
}
