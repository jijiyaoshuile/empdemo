package com.neuedu.service;

import com.neuedu.entity.Dept;

import java.util.List;

public interface DeptService {

    /**
     * 查询所有dept
     * @return
     */
    List<Dept> listDept();
}
