package com.mrgostepz.smooth.service;

import com.mrgostepz.smooth.db.repository.TableInfoRepository;
import com.mrgostepz.smooth.model.db.TableInfo;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class TableInfoService {
    private static final Logger logger = LogManager.getLogger(TableInfoService.class);

    private final TableInfoRepository repository;

    public List<TableInfo> getAll() {
        try {
            List<TableInfo> tableInfoList = repository.findAll();
            logger.info("Get All TableInfo: {}", tableInfoList);
            return tableInfoList;
        } catch (Exception ex) {
            logger.error(ex.getMessage());
        }
        return repository.findAll();
    }

    public TableInfo getTableInfoById(Long id) {
        try {
            Optional<TableInfo> opt = repository.findById(id);
            return opt.orElseGet(TableInfo::new);
        } catch (Exception ex) {
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