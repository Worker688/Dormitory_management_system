package com.example.mapper;

import com.example.entity.Notice;
import com.example.entity.Stay;

import java.util.List;

/**
 * 操作notice相关数据接口
*/
public interface StayMapper {

    /**
      * 新增
    */
    int insert(Stay notice);

    /**
      * 删除
    */
    int deleteById(Integer id);

    /**
      * 修改
    */
    int updateById(Stay notice);

    /**
      * 根据ID查询
    */
    Stay selectById(Integer id);

    /**
      * 查询所有
    */
    List<Stay> selectAll(Stay notice);

    @Select("select * from stay where student_id = #{studentId}")
    Stay selectByStudentId(Integer studentId);

    @Select("select * from stay where dormitory_id = #{dormitoryId} and bed = #{bed}")
    Stay selectByDormitoryIdAndBed(@Param("dormitoryId") Integer dormitoryId, @Param("bed") String bed);
}