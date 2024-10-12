package com.rabbiter.cm.controller;

import com.rabbiter.cm.common.response.ResponseResult;
import com.rabbiter.cm.domain.SysRole;
import com.rabbiter.cm.service.impl.SysRoleServiceImpl;
import com.rabbiter.cm.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class SysRoleController extends BaseController {

    @Autowired
    SysRoleServiceImpl sysRoleService;

    @GetMapping("/sysRole")
    public ResponseResult findAllRoles() {
        startPage();
        List<SysRole> data = sysRoleService.findAllRoles();
        return getResult(data);
    }

    @GetMapping("/sysRole/{id}")
    public ResponseResult findRoleById(@PathVariable Long id) {
        return getResult(sysRoleService.findRoleById(id));
    }

    @PostMapping("/sysRole")
    public ResponseResult addRole(@Validated @RequestBody SysRole sysRole) {
        return getResult(sysRoleService.addRole(sysRole));
    }

    @PutMapping("/sysRole")
    public ResponseResult updateRole(@Validated @RequestBody SysRole sysRole) {
        return getResult(sysRoleService.updateRole(sysRole));
    }

    @DeleteMapping("/sysRole/{ids}")
    public ResponseResult deleteRole(@PathVariable Long[] ids) {
        return getResult(sysRoleService.deleteRole(ids));
    }

    /**
     * 给指定 id 的角色分配权限，包括增加或者删除权限
     * @param roleId
     * @param keys
     * @return
     */
    @PostMapping("/sysRole/{roleId}")
    public ResponseResult allotRight(@PathVariable Long roleId, @RequestBody Long[] keys) {
        return getResult(sysRoleService.allotRight(roleId, keys));
    }

}
