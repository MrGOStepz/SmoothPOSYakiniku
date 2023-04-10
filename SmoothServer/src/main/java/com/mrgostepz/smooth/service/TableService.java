package com.mrgostepz.smooth.service;

import com.mrgostepz.smooth.db.repository.TableCurrentStateRepository;
import com.mrgostepz.smooth.db.repository.TableInfoRepository;
import com.mrgostepz.smooth.exception.InsertRecordException;
import com.mrgostepz.smooth.exception.RecordNotFoundException;
import com.mrgostepz.smooth.model.db.Product;
import com.mrgostepz.smooth.model.db.TableCurrentState;
import com.mrgostepz.smooth.model.db.TableInfo;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TableService {

    private static final Logger logger = LogManager.getLogger(TableService.class);

    private final TableCurrentStateRepository tableCurrentStateRepository;
    private final TableInfoRepository tableInfoRepository;

    private List<TableCurrentState> tableCurrentStateItem = new ArrayList<>();

    private List<TableInfo> tableInfoItem = new ArrayList<>();


    @Autowired
    public void init() {
        tableCurrentStateItem = tableCurrentStateRepository.getAll();
        tableInfoItem = tableInfoRepository.getAll();
    }

    public TableCurrentState getTableCurrentStateFromCacheById (int id) {
        List<TableCurrentState> tableCurrentState = tableCurrentStateItem.stream().filter(value -> value.getId() == id).collect(Collectors.toList());
        return tableCurrentState.get(0);
    }


    public TableInfo getTableInfoFromCacheById (int id) {
        List<TableInfo> tableInfo = tableInfoItem.stream().filter(value -> value.getTableInfoId() == id).collect(Collectors.toList());
        return tableInfo.get(0);
    }

    public List<TableCurrentState> getTableCurrentStateItem() {
        return tableCurrentStateItem;
    }

    public List<TableInfo> getTableInfoItem(){
        return tableInfoItem;
    }

    public List<TableCurrentState> getAllTableCurrentState() {
        List<TableCurrentState> tableCurrentStateReList = tableCurrentStateRepository.getAll();
        if (tableCurrentStateReList == null) {
            throw new RecordNotFoundException("There is no record in tableCurrentState table.");
        }
        logger.info(tableCurrentStateReList);
        return tableCurrentStateRepository.getAll();
    }

    public TableCurrentState getTableCurrentStateById(int id) {
        TableCurrentState tableCurrentState = tableCurrentStateRepository.getById(id);
        if (tableCurrentState == null) {
            throw new RecordNotFoundException("There is no tableCurrentState in this id.");
        }
        logger.info("TableCurrentState {}", tableCurrentState);
        return tableCurrentState;
    }

    public void addTableCurrentState(TableCurrentState tableCurrentState) {
        int tableCurrentStateReId = tableCurrentStateRepository.add(tableCurrentState);
        tableCurrentState.setId(tableCurrentStateReId);
        if (tableCurrentStateReId > 0) {
            logger.info("Add new tableCurrentState Successfully: {}", tableCurrentState);
        } else {
            logger.warn("Cannot add new tableCurrentState: {}", tableCurrentState);
            throw new InsertRecordException("Cannot Create");
        }
    }

    public void updateTableCurrentState(TableCurrentState tableCurrentState) {
        if (Boolean.TRUE.equals(tableCurrentStateRepository.update(tableCurrentState))) {
            logger.info("Update tableCurrentState Successfully: {}", tableCurrentState);
        } else {
            logger.warn("Cannot Update tableCurrentState: {}", tableCurrentState);
        }
    }

    public void deleteTableCurrentState(int id) {
        if (Boolean.TRUE.equals(tableCurrentStateRepository.deleteById(id))) {
            logger.info("Delete tableCurrentState Successfully: {}", id);
        } else {
            logger.warn("Cannot Delete tableCurrentState: {}", id);
        }
    }

    public List<TableInfo> getAllTableInfo() {
        List<TableInfo> tableInfoList = tableInfoRepository.getAll();
        if (tableInfoList == null) {
            throw new RecordNotFoundException("There is no record in tableCurrentState table.");
        }
        logger.info(tableInfoList);
        return tableInfoList;
    }

    public TableInfo getTableInfoById(int id) {
        TableInfo tableInfo = tableInfoRepository.getById(id);
        if (tableInfo == null) {
            throw new RecordNotFoundException("There is no tableCurrentState in this id.");
        }
        logger.info("TableInfo {}", tableInfo);
        return tableInfo;
    }

    public void addTableInfo(TableInfo tableInfo) {
        int tableInfoId = tableInfoRepository.add(tableInfo);
        tableInfo.setTableInfoId(tableInfoId);
        if (tableInfoId > 0) {
            logger.info("Add new tableInfo Successfully: {}", tableInfo);
        } else {
            logger.warn("Cannot add new tableInfo: {}", tableInfo);
            throw new InsertRecordException("Cannot Create");
        }
    }

    public void updateTableInfo(TableInfo tableInfo) {
        if (Boolean.TRUE.equals(tableInfoRepository.update(tableInfo))) {
            logger.info("Update tableInfo Successfully: {}", tableInfo);
        } else {
            logger.warn("Cannot Update tableInfo: {}", tableInfo);
        }
    }

    public void deleteTableInfo(int id) {
        if (Boolean.TRUE.equals(tableInfoRepository.deleteById(id))) {
            logger.info("Delete tableInfo Successfully: {}", id);
        } else {
            logger.warn("Cannot Delete tableInfo: {}", id);
        }


    }
}