package com.neuedu.service.impl;

import com.neuedu.entity.Dept;
import com.neuedu.mapper.DeptMapper;
import com.neuedu.mapper.EmpMapper;
import com.neuedu.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService{

    @Autowired
    private DeptMapper deptMapper;
    @Autowired
    private EmpMapper empMapper;

    @Override
    public List<Dept> listDept() {
        return deptMapper.listDept();
    }

    @Override
    public int deleteDeptById(int[] ids) {
        int count = deptMapper.deleteDeptById(ids);
        empMapper.deleteEmpByDeptid(ids);
        return count;
    }


}
