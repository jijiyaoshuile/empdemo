package com.neuedu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neuedu.entity.Emp;
import com.neuedu.service.DeptService;
import com.neuedu.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = {"/emp"})
public class EmpController {

    @Autowired
    private EmpService empService;
    @Autowired
    private DeptService deptService;

    @RequestMapping(value = {"/emplist"})
    public String empList(ModelMap modelMap, @RequestParam(name = "pageNum",defaultValue = "1") int pageNum, HttpSession httpSession){

        //在查询之前调用插件的分页方法
        PageHelper.startPage(pageNum,10);
        List<Emp> empList = empService.listEmp();
        PageInfo<Emp> pageInfo = new PageInfo<>(empList,10);
        modelMap.put("pageInfo",pageInfo);
        //将当前页码存入到session中
        httpSession.setAttribute("pageNum",pageInfo.getPageNum());
        return "emplist";
    }

    @RequestMapping(value = {"/deleteEmpById"})
    public String deleteEmpById(int[] id,HttpSession httpSession){
        empService.deleteEmpByIds(id);
        Integer pageNum = (Integer) httpSession.getAttribute("pageNum");
        return "redirect:/emp/emplist?pageNum=" + pageNum;
    }

    @RequestMapping(value = {"/addEmpView"})
    public String addEmpView(ModelMap param){
        param.put("deptList",deptService.listDept());
        return "addEmp";
    }

    @RequestMapping(value = {"/addEmp"})
    public String addEmp(Emp emp){
        int pageNum = empService.saveEmp(emp);
        return "redirect:/emp/emplist?pageNum=" + pageNum;
    }

    @RequestMapping(value = {"/updateEmpView"})
    public String updateEmpView(ModelMap param,int id){
        param.put("deptList",deptService.listDept());
        param.put("emp",empService.getEmpById(id));
        return "updateEmp";
    }

    @RequestMapping(value = {"/updateEmp"})
    public String updateEmp(Emp emp,HttpSession httpSession){
        empService.updateEmp(emp);
        Integer pageNum = (Integer) httpSession.getAttribute("pageNum");
        return "redirect:/emp/emplist?pageNum=" + pageNum;
    }

}
