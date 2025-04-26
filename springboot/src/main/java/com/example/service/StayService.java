package com.example.service;

import cn.hutool.core.date.DateUtil;
import com.example.entity.Account;
import com.example.entity.Stay;
import com.example.exception.CustomException;
import com.example.mapper.DormitoryMapper;
import com.example.mapper.StayMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import javafx.beans.binding.Bindings;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 住宿信息表业务处理
 **/
@Service
public class StayService {

    @Resource
    private StayMapper stayMapper;
    @Resource
    private DormitoryMapper  dormitoryMapper;

    /**
     * 新增
     */
    public void add(Stay stay) {
        //查询当前学生有没有住宿信息
        Stay dbStay = stayMapper.selectByStudentId(stay.getStudentId());
        if (ObjectUtil.isNotEmpty(dbStay)){
            throw new CustomException("-1","该学生已有住宿信息,请勿重复添加");
        }
        if (ObjectUtil.isNotEmpty(stay.getDormitoryId())){
            //根据寝室ID查询出寝室信息
            Dormitory dormitory = dormitoryMapper.selectById(stay.getDormitoryId());
            if (ObjectUtil.isNotEmpty(dormitory)){
                //先去校验一下该宿舍有没有住满
                if (dormitory.getNum().equals(dormitory.getNowNum())){
                    throw new CustomException("-1","该宿舍已经住满，请分配到其他宿舍");
                }
                //初始化宿舍楼ID字段
                stay.setBuildingId(dormitory.getBuildingId());
                //同步宿舍表里对应的已住人数
                dormitory.setNowNum(dormitory.getNowNum() + 1);
                dormitoryMapper.updateById(dormitory);

            }
        }
        stayMapper.insert(stay);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        stayMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            stayMapper.deleteById(id);
        }
    }

    /**
     * 修改
     */
    public void updateById(Stay stay) {
        stayMapper.updateById(stay);
    }

    /**
     * 根据ID查询
     */
    public Stay selectById(Integer id) {
        return stayMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Stay> selectAll(Stay stay) {
        return stayMapper.selectAll(stay);
    }

    /**
     * 分页查询
     */
    public PageInfo<Stay> selectPage(Stay stay, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Stay> list = stayMapper.selectAll(stay);
        return PageInfo.of(list);
    }

}