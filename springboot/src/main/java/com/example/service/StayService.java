package com.example.service;

import cn.hutool.core.date.DateUtil;
import com.example.entity.Account;
import com.example.entity.Stay;
import com.example.mapper.StayMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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

    /**
     * 新增
     */
    public void add(Stay stay) {
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