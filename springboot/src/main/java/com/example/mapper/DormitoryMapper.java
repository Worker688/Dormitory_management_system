package com.example.mapper;

import com.example.entity.Dormitory;

import java.util.List;

/**
 * 操作dormitory相关数据接口
*/
public interface DormitoryMapper {

    /**
      * 新增
    */
    int insert(Dormitory dormitory);

    /**
      * 删除
    */
    int deleteById(Integer id);

    /**
      * 修改
    */
    int updateById(Dormitory dormitory);

    /**
      * 根据ID查询
    */
    Dormitory selectById(Integer id);

    /**
      * 查询所有
    */
    List<Dormitory> selectAll(Dormitory dormitory);

}