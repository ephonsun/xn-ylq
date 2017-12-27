package com.cdkj.ylq.bo.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cdkj.ylq.bo.IStatisticBO;
import com.cdkj.ylq.bo.base.PaginableBOImpl;
import com.cdkj.ylq.dao.IStatisticDAO;
import com.cdkj.ylq.domain.Statistic;

@Component
public class StatisticBOImpl extends PaginableBOImpl<Statistic> implements
        IStatisticBO {

    @Autowired
    private IStatisticDAO statisticDAO;

    @Override
    public List<Statistic> queryStatisticList(Statistic condition) {
        return statisticDAO.selectList(condition);
    }

    @Override
    public void doInsertStatisticDaily() {
        statisticDAO.doInsertStatisticDaily(null);
    }

}
