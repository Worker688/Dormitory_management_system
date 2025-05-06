package com.example.mapper;

import com.example.entity.Exchanges;

import java.util.List;

/**
 * 操作exchanges相关数据接口
*/
public interface ExchangesMapper {

    /**
      * 新增
    */
    int insert(Exchanges exchanges);

    /**
      * 删除
    */
    int deleteById(Integer id);

    /**
      * 修改
    */
    int updateById(Exchanges exchanges);

    /**
      * 根据ID查询
    */
    Exchanges selectById(Integer id);

    /**
      * 查询所有
    */
    List<Exchanges> selectAll(Exchanges exchanges);

}