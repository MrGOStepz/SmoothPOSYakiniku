package com.mrgostepz.smooth.service;

import com.mrgostepz.smooth.db.repository.TableCurrentStateRepository;
import com.mrgostepz.smooth.exception.InsertRecordException;
import com.mrgostepz.smooth.exception.RecordNotFoundException;
import com.mrgostepz.smooth.model.db.TableCurrentState;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TableService {

    private static final Logger logger = LogManager.getLogger(TableService.class);

    private final TableCurrentStateRepository tableCurrentStateRepository;

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

}
