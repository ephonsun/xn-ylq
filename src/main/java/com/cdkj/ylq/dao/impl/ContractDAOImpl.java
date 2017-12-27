package com.cdkj.ylq.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cdkj.ylq.dao.IContractDAO;
import com.cdkj.ylq.dao.base.support.AMybatisTemplate;
import com.cdkj.ylq.domain.Contract;

@Repository("contractDAOImpl")
public class ContractDAOImpl extends AMybatisTemplate implements IContractDAO {

    @Override
    public int insert(Contract data) {
        return super.insert("insert_contract", data);
    }

    @Override
    public int delete(Contract data) {
        return 0;
    }

    @Override
    public Contract select(Contract condition) {
        return super.select("select_contract", condition, Contract.class);
    }

    @Override
    public Long selectTotalCount(Contract condition) {
        return super.selectTotalCount("select_contract_count", condition);
    }

    @Override
    public List<Contract> selectList(Contract condition) {
        return super.selectList("select_contract_list", condition,
            Contract.class);
    }

    @Override
    public List<Contract> selectList(Contract condition, int start, int count) {
        return super.selectList("select_contract_list", start, count,
            condition, Contract.class);
    }

    @Override
    public int stopContract(Contract data) {
        return super.update("update_stopContract", data);
    }

}
