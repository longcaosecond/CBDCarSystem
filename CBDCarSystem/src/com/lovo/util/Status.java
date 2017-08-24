package com.lovo.util;

public interface Status {
public static final int PUTONG=0;// 普通用户
public static final int DAISHENJI=1;//包租婆审核中
public static final int BAOZUPO=2;//包租婆
public static final int SHENGHE=0;//rent还没发布，审核中
public static final int CHUZU=1;//rent审核通过出租中  3 代表审批不通过
public static final int YIZU=2;//rent已租
public static final int CHULIZHONG=0;//投诉处理中
public static final int YICHULI=1;//投诉已查看但是不成立 2 代表投诉已查看而且成立对被投诉方的信誉造成影响
public static final int ZHIXINGZHONG = 1;//合约执行中
public static final int YIJIESHU = 0;//合约以结束
public static final int wantType = 0;//1 代表租客发出，2代表包租婆以看不同意，3代表包租婆看了要同意，4代表租客看了返回信息不同意，5代表租客看了同意
public static final int WEIZU = 0;//企业车位未租
public static final int WEIDU = 0;//消息未读
public static final int YONGHU = 1;//1代表用户管理权限
public static final int CHEWEI = 2;//2代表车位管理权限
public static final int HETONG = 3;//3代表 合同管理权限
public static final int TOUSU = 4;//4代表投诉管理权限
}
