package com.mrgostepz.smooth.controller;

import com.mrgostepz.smooth.model.db.TableInfo;
import com.mrgostepz.smooth.service.TableInfoService;
import com.mrgostepz.smooth.until.SmoothUtil;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping(path = "api/v1/table")
class TableInfoController {

    private static final Logger logger = LogManager.getLogger(TableInfoController.class);

    private final TableInfoService tableInfoService;

    @GetMapping(path = "/all")
    @ResponseBody
    public ResponseEntity<List<TableInfo>> getAllTableCurrentState() {
        return new ResponseEntity<>(tableInfoService.getAll(), HttpStatus.OK);
    }

    @GetMapping(path = "/{name}")
    @ResponseBody
    public ResponseEntity<TableInfo> getTableCurrentStateById(@PathVariable String name) {
        TableInfo tableInfo = tableInfoService.getTableInfoByName(name);
        return new ResponseEntity<>(tableInfo, HttpStatus.OK);
    }

    @PostMapping(path = "/add")
    @ResponseBody
    public ResponseEntity<TableInfo> addTableInfo(@RequestBody String jsonReq){
        TableInfo request = (TableInfo) SmoothUtil.convertJsonToObject(jsonReq, TableInfo.class);
        assert request != null;
        return new ResponseEntity<>(tableInfoService.addTableInfo(request), HttpStatus.OK);
    }

    @PutMapping(path = "/update/status")
    public String updateTableInfoStatus(@RequestBody String jsonReq) {
        TableInfo request = (TableInfo) SmoothUtil.convertJsonToObject(jsonReq, TableInfo.class);
        assert request != null;
        tableInfoService.updateTableInfoStatusByName(request.getStatus(), request.getName());
        return String.format("Updated TableInfo Name: %s, Status: %s Successfully.", request.getName(), request.getStatus());
    }
}
