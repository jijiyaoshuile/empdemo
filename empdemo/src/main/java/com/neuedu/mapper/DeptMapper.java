package com.neuedu.mapper;

import com.neuedu.entity.Dept;

import java.util.List;

public interface DeptMapper {

    /**
     * 查询所有dept
     * @return
     */
    List<Dept> listDept();
}
