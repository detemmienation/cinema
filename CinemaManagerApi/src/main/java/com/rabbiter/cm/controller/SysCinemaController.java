package com.rabbiter.cm.controller;

import com.rabbiter.cm.common.response.ResponseResult;
import com.rabbiter.cm.domain.SysCinema;
import com.rabbiter.cm.domain.SysSession;
import com.rabbiter.cm.service.impl.SysCinemaServiceImpl;
import com.rabbiter.cm.service.impl.SysSessionServiceImpl;
import com.rabbiter.cm.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;


@RestController
public class SysCinemaController extends BaseController {

    @Autowired
    private SysCinemaServiceImpl sysCinemaService;

    @Autowired
    private SysSessionServiceImpl sysSessionService;

    @GetMapping("/sysCinema")
    public ResponseResult findCinema() {
        return getResult(sysCinemaService.findCinema());
    }

    @PutMapping("/sysCinema/update")
    public ResponseResult updateCinema(@Validated @RequestBody SysCinema sysCinema) {
        return getResult(sysCinemaService.updateCinema(sysCinema));
    }

    @GetMapping(value = {"/sysCinema/find/{cinemaId}/{movieId}", "/sysCinema/find/{cinemaId}"})
    public ResponseResult findCinemaById(@PathVariable Long cinemaId, @PathVariable(required = false) Long movieId) {
        SysCinema cinema = sysCinemaService.findCinemaById(cinemaId);
        if (movieId == null || movieId == 0) {
            movieId = cinema.getSysMovieList().size() > 0 ? cinema.getSysMovieList().get(0).getMovieId() : 0;
        }
        List<SysSession> sessions = null;
        if (movieId != null && movieId != 0) {
            sessions = sysSessionService.findSessionByMovieId(movieId);
        }

        HashMap<String, Object> response = new HashMap<>();
        response.put("cinema", cinema);
        response.put("sessions", sessions);
        return getResult(response);
    }

}
