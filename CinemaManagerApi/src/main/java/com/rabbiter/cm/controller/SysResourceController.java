package com.rabbiter.cm.controller;

import com.rabbiter.cm.common.response.ResponseResult;
import com.rabbiter.cm.domain.SysResource;
import com.rabbiter.cm.service.impl.SysResourceServiceImpl;
import com.rabbiter.cm.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class SysResourceController extends BaseController {

    @Autowired
    SysResourceServiceImpl sysResourceService;

    @GetMapping("/sysResource")
    public ResponseResult findAllResources() {
        startPage();
        List<SysResource> data = sysResourceService.findAllResources();
        return getResult(data);
    }

    @GetMapping("/sysResource/children")
    public ResponseResult findWithChildren() {
        return getResult((Object) sysResourceService.findWithChildren());
    }

    @GetMapping("/sysResource/{id}")
    public ResponseResult findResourceById(@PathVariable Long id) {
        return getResult(sysResourceService.findResourceById(id));
    }

    @GetMapping("/sysResource/tree")
    public ResponseResult findAllWithAllChildren() {
        return getResult(sysResourceService.findAllWithAllChildren());
    }

    @PostMapping("/sysResource")
    public ResponseResult addResource(@Validated @RequestBody SysResource sysResource) {
        return getResult(sysResourceService.addResource(sysResource));
    }

    @PutMapping("/sysResource")
    public ResponseResult updateResource(@Validated @RequestBody SysResource sysResource) {
        return getResult(sysResourceService.updateResource(sysResource));
    }

    @DeleteMapping("/sysResource/{ids}")
    public ResponseResult deleteResource(@PathVariable Long[] ids) {
        return getResult(sysResourceService.deleteResource(ids));
    }

}
