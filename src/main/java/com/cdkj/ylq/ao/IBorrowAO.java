package com.cdkj.ylq.ao;

import com.cdkj.ylq.bo.base.Paginable;
import com.cdkj.ylq.domain.Borrow;

public interface IBorrowAO {
    static final String DEFAULT_ORDER_COLUMN = "code";

    // 客户端：使用额度借款
    public String borrow(String userId, Long couponId);

    // 管理端：借款订分页单查询
    public Paginable<Borrow> queryBorrowPage(int start, int limit,
            Borrow condition);

    // 客户端：我的借款订单查询
    public Paginable<Borrow> queryMyBorrowPage(int start, int limit,
            Borrow condition);

    public Borrow getBorrow(String code);

    // 管理端：放款
    public void loan(String code, String updater, String remark);

    // 客户端：我要还款，返回三方支付所需参数
    public Object repay(String code, String payType);

    // 客户端：还款成功回调
    public void repaySuccess(String payGroup, String payType, String payCode,
            Long amount);

    // 管理端：确认坏账
    public void confirmBad(String code, String updater, String remark);

}
