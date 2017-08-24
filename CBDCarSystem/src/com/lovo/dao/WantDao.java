package com.lovo.dao;

import java.util.List;

import com.lovo.bean.Want;

public interface WantDao {
/**添加求租信息
 * @param rentId 求租Id
 * @param userId 求租人Id
 * @param message 求租人留言
 */
public void addWant(int rentId,int userId,String message);

/**查询抢租客的所有求租请求want
 * @param userId
 * @return 求租请求集合
 */
public List<Want> selectWantsByUserId(int userId);

/**
 * 根据用户的个人信息返回所有的发送过来的信息 针对包租婆
 * @param currentPage 当前页
 * @param pageSize 每页显示的信息条数
 * @return 放回一个want对象
 */
public List<Want> findWantInfo(int userId,int wantType,int currentPage,int pageSize);

/**
 * 根据用户的个人信息返回所有的发送过来的信息 针对找租客
 * @param currentPage 当前页
 * @param pageSize 每页显示的信息条数
 * @return 放回一个want对象
 */
public List<Want> findWantInfoByZ(int userId,int currentPage,int pageSize);

/**
 * 根据want的id获取到指定的want对象
 * @param wantId 传递过来的额want的id
 * @return 查询到的want对象
 */
public Want findWantByWantId(int wantId);

/**
 *  根据传递过来的id值和type值 修改指定want的状态
 * @param wantId 页面传递过来的want的id
 * @param wantType 页面传递过来的type的值
 */
public void updateWantTypeByWantId(int wantId,int wantType);

/**
 *  根据userId 查出对应的want信息的条数 针对包租婆
 * @param wantId 传递火来的用户的id
 * @param wantType wnat信息的状态
 * @return
 */
public int findWantCountByWantTypeAndId(int userId,int wantType);

/**
 *  根据userId 查出对应的want信息的条数  针对找租客
 * @param wantId 传递火来的用户的id
 * @param wantType wnat信息的状态
 * @return
 */
public int findWantCountByWantTypeAndUserId(int userId,int wantType);
}
