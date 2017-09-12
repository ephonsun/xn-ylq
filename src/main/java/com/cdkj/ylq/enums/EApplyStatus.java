package com.cdkj.ylq.enums;

public enum EApplyStatus {
    TO_CERTI("1", "认证中"), TO_APPROVE("2", "待审核"), APPROVE_NO("3", "已驳回"), APPROVE_YES(
            "4", "审核通过"), TO_LOAN("5", "等待放款中"), LOANING("6", "生效中"), OVERDUE(
            "7", "已逾期"), REPAY("8", "已还款"), CANCEL("9", "已取消"), BAD("10",
            "确认坏账"), LOAN_NO("11", "打款失败");

    EApplyStatus(String code, String value) {
        this.code = code;
        this.value = value;
    }

    private String code;

    private String value;

    public String getCode() {
        return code;
    }

    public String getValue() {
        return value;
    }
}
