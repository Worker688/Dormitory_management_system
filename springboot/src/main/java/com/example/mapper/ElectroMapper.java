package com.example.mapper;

import com.example.entity.Electro;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 操作electro相关数据接口
*/
public interface ElectroMapper {

    /**
      * 新增
    */
    int insert(Electro electro);

    /**
      * 删除
    */
    int deleteById(Integer id);

    /**
      * 修改
    */
    int updateById(Electro electro);

    /**
      * 根据ID查询
    */
    Electro selectById(Integer id);

    /**
      * 查询所有
    */
    List<Electro> selectAll(Electro electro);

    @Select("select * from electro where dormitory_id = #{dormitoryId} and content = #{content}")
    Electro selectByDormitoryIdAndContent(@Param("dormitoryId") Integer dormitoryId, @Param("content") String content);
}