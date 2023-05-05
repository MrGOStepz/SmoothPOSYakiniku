package com.mrgostepz.smooth.service;

import com.mrgostepz.smooth.db.repository.TableInfoRepository;
import com.mrgostepz.smooth.model.db.TableInfo;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TableInfoService {
    private static final Logger logger = LogManager.getLogger(TableInfoService.class);

    private final TableInfoRepository repository;

    public List<TableInfo> getAll() {
        try {
            List<TableInfo> tempTableInfo = repository.findAll();
            List<TableInfo> tableInfoList = tempTableInfo.stream().sorted(
                    Comparator.comparingInt(TableInfo::getOrder)).collect(Collectors.toList());
            logger.debug("Get All TableInfo: {}", tableInfoList);
            return tableInfoList;
        } catch (Exception ex) {
            logger.error(ex.getMessage());
            return new ArrayList<>();
        }
    }

    public TableInfo getTableInfoByName(String name) {
        try {
            Optional<List<TableInfo>> opt = Optional.ofNullable(repository.findByName(name));
            List<TableInfo> tableInfoList = opt.orElseGet(ArrayList::new);
            TableInfo tableInfo = tableInfoList.get(0);
            logger.info("Get TableInfoName: {}, TableInfo: {}", name, tableInfo);
            return tableInfo;
        } catch (Exception ex) {
            logger.error(ex.getMessage());
            return new TableInfo();
        }
    }

    public TableInfo addTableInfo(TableInfo tableInfo) {
        try {
            repository.save(tableInfo);
            logger.info("Add new TableInfo: {} \nSuccessfully.", tableInfo);
            return tableInfo;
        } catch (Exception ex) {
            logger.error("Cannot add new TableInfo {}", ex.getMessage());
            return new TableInfo();
        }
    }

    public void updateTableInfoStatusByName(String status, String name) {
        try {
            repository.updateTableInfoStatusByName(status, name);
            logger.info("Updated TableInfo Name: {}, Status: {}", name, status);
        } catch (Exception ex) {
            logger.error(ex.getMessage());
        }
    }
}