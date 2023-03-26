package com.mrgostepz.smooth.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mrgostepz.smooth.model.db.TableCurrentState;
import com.mrgostepz.smooth.model.enumtype.Status;
import com.mrgostepz.smooth.service.TableService;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

import static com.mrgostepz.smooth.model.constraint.JsonKey.*;

//https://mkyong.com/spring-boot/spring-rest-error-handling-example/
//http://localhost:8080/spring-mvc-basics/foos?id=abc
// @RequestParam means it is a parameter from the GET or POST request

@RestController
@RequiredArgsConstructor
@RequestMapping(path = "api/v1/tableCurrentState")
class TableCurrentStateController {

    private static final Logger logger = LogManager.getLogger(TableCurrentStateController.class);

    private final TableService tableService;

    @GetMapping(path = "/all")
    @ResponseBody
    public ResponseEntity<List<TableCurrentState>> getAllTableCurrentState() {
        return new ResponseEntity<>(tableService.getAllTableCurrentState(), HttpStatus.OK);
    }

    @GetMapping(path = "/{id}")
    @ResponseBody
    public ResponseEntity<TableCurrentState> getTableCurrentStateById(@PathVariable int id) {
        TableCurrentState tableCurrentState = tableService.getTableCurrentStateById(id);
        return new ResponseEntity<>(tableCurrentState, HttpStatus.OK);
    }

    @PostMapping(path = "/add")
    @ResponseBody
    public ResponseEntity<String> addNewTableCurrentState(@RequestBody String jsonReq) {
        TableCurrentState tableCurrentState = convertJsonToTableCurrentState(jsonReq);
        tableService.addTableCurrentState(tableCurrentState);
        return new ResponseEntity<>(String.format("Add new tableCurrentState successfully: %s", tableCurrentState.toString()), HttpStatus.CREATED);
    }

    @PutMapping(path = "/update")
    public String updateTableCurrentState(@RequestBody String jsonReq) {
        TableCurrentState tableCurrentState = convertJsonToTableCurrentState(jsonReq);
        tableService.updateTableCurrentState(tableCurrentState);
        return String.format("Update TableCurrentState: %s completed.", tableCurrentState);
    }

    @DeleteMapping("/{id}")
    public String deleteTableCurrentState(@PathVariable int id) {
        tableService.deleteTableCurrentState(id);
        return String.format("Delete TableCurrentState Id: %d completed.", id);
    }

    private TableCurrentState convertJsonToTableCurrentState(String json){
        try {
            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> map = mapper.readValue(json, Map.class);
            TableCurrentState tableCurrentState = new TableCurrentState();
            tableCurrentState.setTableCurrentStateId((Integer) map.get(TABLE_CURRENT_STATE_ID));
            tableCurrentState.setTableId((Integer) map.get(TABLE_ID));
            tableCurrentState.setOrderId((Integer) map.get(ORDER_ID));
            tableCurrentState.setStatus(Status.fromString((String) map.get(STATUS)));
            return tableCurrentState;
        } catch (Exception ex) {
            logger.error(ex.getMessage());
            return null;
        }
    }


}
