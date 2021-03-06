ALTER TABLE `t_borrow` 
ADD COLUMN `lx_rate` DECIMAL(18,8) NULL COMMENT '正常利息利率' AFTER `hk_datetime`,
ADD COLUMN `xs_rate` DECIMAL(18,8) NULL COMMENT '快速信审费利率' AFTER `lx_amount`,
ADD COLUMN `gl_rate` DECIMAL(18,8) NULL COMMENT '账户管理费利率' AFTER `xs_amount`,
ADD COLUMN `fw_rate` DECIMAL(18,8) NULL COMMENT '服务费利率' AFTER `gl_amount`,
ADD COLUMN `renewal_count` INT(11) NULL COMMENT '续期次数' AFTER `pay_type`;

ALTER TABLE `t_certification` 
CHANGE COLUMN `ref` `ref` LONGTEXT NULL DEFAULT NULL COMMENT '关联申请单' ;

CREATE TABLE `t_repay_apply` (
  `code` VARCHAR(32) NOT NULL COMMENT '编号',
  `ref_no` VARCHAR(32) NULL COMMENT '关联订单号',
  `type` VARCHAR(32) NULL COMMENT '打款类型',
  `amount` BIGINT(32) NULL COMMENT '打款金额',
  `apply_user` VARCHAR(32) NULL COMMENT '申请人',
  `apply_note` VARCHAR(255) NULL COMMENT '申请备注',
  `apply_datetime` DATETIME NULL COMMENT '申请时间',
  `approver` VARCHAR(32) NULL COMMENT '审核人',
  `approve_note` VARCHAR(255) NULL COMMENT '审核说明',
  `approve_datetime` DATETIME NULL COMMENT '审核时间',
  `status` VARCHAR(32) NULL COMMENT '状态',
  PRIMARY KEY (`code`)  COMMENT '')
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_renewal` (
  `code` VARCHAR(32) NOT NULL COMMENT '编号',
  `apply_user` VARCHAR(32) NULL COMMENT '申请人',
  `borrow_code` VARCHAR(32) NULL COMMENT '借款编号',
  `step` INT(11) NULL COMMENT '续期步长',
  `cycle` INT(11) NULL COMMENT '续期周期',
  `start_date` DATETIME NULL COMMENT '开始时间',
  `end_date` DATETIME NULL COMMENT '结束时间',
  `yq_amount` BIGINT(32) NULL COMMENT '续期前逾期费',
  `xs_amount` BIGINT(32) NULL COMMENT '快速信审费',
  `gl_amount` BIGINT(32) NULL COMMENT '账户管理费',
  `fw_amount` BIGINT(32) NULL COMMENT '服务费',
  `lx_amount` BIGINT(32) NULL COMMENT '利息',
  `total_amount` BIGINT(32) NULL COMMENT '续费总费用',
  `pay_datetime` DATETIME NULL COMMENT '支付时间',
  `pay_type` VARCHAR(32)  NULL COMMENT '支付方式',
  `pay_code` VARCHAR(32)  NULL COMMENT '三方支付编号',
  `pay_group` VARCHAR(32)  NULL COMMENT '支付组号',
  `create_datetime` DATETIME NULL COMMENT '创建时间',
  `status` VARCHAR(32)  NULL COMMENT '状态',
  `cur_no` INT(11) NULL COMMENT '第几次续期',
  PRIMARY KEY (`code`)  COMMENT '')
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_overdue` (
  `id` BIGINT(32) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` VARCHAR(32) NULL COMMENT '用户编号',
  `borrow_code` VARCHAR(32) NULL COMMENT '关联借款订单号',
  `days` INT(11) NULL COMMENT '逾期天数',
  `amount` BIGINT(32) NULL COMMENT '逾期金额',
  `result` VARCHAR(32) NULL COMMENT '逾期后处理',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tsys_config` (`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`,`company_code`,`system_code`) VALUES ('1','sendSmsCount','5','admin',now(),'催收联系人数量','CD-YLQ000014','CD-YLQ000014');
INSERT INTO `tsys_config` (`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`,`company_code`,`system_code`) VALUES ('1','renewalStep','7','admin',now(),'续期步长','CD-YLQ000014','CD-YLQ000014');
INSERT INTO `tsys_config` (`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`,`company_code`,`system_code`) VALUES ('1','renewalLimit','5','admin',now(),'最大续期次数','CD-YLQ000014','CD-YLQ000014');
INSERT INTO `tsys_config` (`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`,`company_code`,`system_code`) VALUES ('2','smsCuishou','先生/女士，您好，请通知%s（%s），其在【九州宝】的欠款已严重逾期。若%s不能及时处理，产生的责任和影响由其本人承担！打扰之处敬请谅解。','admin',now(),'催收短信模板','CD-YLQ000014','CD-YLQ000014');
INSERT INTO `tsys_config` (`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`,`company_code`,`system_code`) VALUES ('2','mxUrl','https://api.51datakey.com/carrier/v3/mobiles/%s/mxreport?task_id=%s','admin',now(),'魔蝎URL','CD-YLQ000014','CD-YLQ000014');
INSERT INTO `tsys_config` (`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`,`company_code`,`system_code`) VALUES ('2','mxApiKey','96ee985a972a4685be2bb423588e008f','admin',now(),'魔蝎apiKey','CD-YLQ000014','CD-YLQ000014');
INSERT INTO `tsys_config` (`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`,`company_code`,`system_code`) VALUES ('2','mxToken','76216f728af3416083f20a13f9ddb2a9','admin',now(),'魔蝎token','CD-YLQ000014','CD-YLQ000014');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`company_code`,`system_code`) VALUES ('1','pay_type','4','线下','admin',now(),NULL,'CD-YLQ000014','CD-YLQ000014');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`company_code`,`system_code`) VALUES ('1','borrow_status','7','打款失败','admin',now(),NULL,'CD-YLQ000014','CD-YLQ000014');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`company_code`,`system_code`) VALUES ('0','','repay_apply_status','线下打款申请状态','admin',now(),NULL,'CD-YLQ000014','CD-YLQ000014');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`company_code`,`system_code`) VALUES ('1','repay_apply_status','0','待审核','admin',now(),NULL,'CD-YLQ000014','CD-YLQ000014');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`company_code`,`system_code`) VALUES ('1','repay_apply_status','1','审核通过','admin',now(),NULL,'CD-YLQ000014','CD-YLQ000014');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`company_code`,`system_code`) VALUES ('1','repay_apply_status','2','审核不通过','admin',now(),NULL,'CD-YLQ000014','CD-YLQ000014');

INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`company_code`,`system_code`) VALUES ('0','','repay_apply_type','线下打款申请类型','admin',now(),NULL,'CD-YLQ000014','CD-YLQ000014');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`company_code`,`system_code`) VALUES ('1','repay_apply_type','0','线下还款','admin',now(),NULL,'CD-YLQ000014','CD-YLQ000014');
INSERT INTO `tsys_dict` (`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`,`company_code`,`system_code`) VALUES ('1','repay_apply_type','1','线下续期','admin',now(),NULL,'CD-YLQ000014','CD-YLQ000014');
