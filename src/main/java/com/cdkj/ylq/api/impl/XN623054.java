/**
 * @Title XN623040.java 
 * @Package com.cdkj.ylq.api.impl 
 * @Description 
 * @author leo(haiqing)  
 * @date 2017年8月12日 下午12:07:58 
 * @version V1.0   
 */
package com.cdkj.ylq.api.impl;

import com.cdkj.ylq.ao.ICertificationAO;
import com.cdkj.ylq.api.AProcessor;
import com.cdkj.ylq.common.JsonUtil;
import com.cdkj.ylq.core.StringValidater;
import com.cdkj.ylq.dto.req.XN623054Req;
import com.cdkj.ylq.exception.BizException;
import com.cdkj.ylq.exception.ParaException;
import com.cdkj.ylq.spring.SpringContextHolder;

/** 
 * 同盾报告获取
 * @author: haiqingzheng 
 * @since: 2017年8月12日 下午12:07:58 
 * @history:
 */
public class XN623054 extends AProcessor {

    private ICertificationAO certificationAO = SpringContextHolder
        .getBean(ICertificationAO.class);

    private XN623054Req req = null;

    /** 
     * @see com.cdkj.ylq.api.IProcessor#doBusiness()
     */
    @Override
    public Object doBusiness() throws BizException {
        return certificationAO.doTongDunPreloanQuery(req.getUserId());
    }

    /** 
     * @see com.cdkj.ylq.api.IProcessor#doCheck(java.lang.String)
     */
    @Override
    public void doCheck(String inputparams) throws ParaException {
        req = JsonUtil.json2Bean(inputparams, XN623054Req.class);
        StringValidater.validateBlank(req.getUserId());
    }
}
