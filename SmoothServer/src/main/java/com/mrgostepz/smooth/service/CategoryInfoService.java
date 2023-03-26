package com.mrgostepz.smooth.service;

import com.mrgostepz.smooth.db.repository.CategoryInfoRepository;
import com.mrgostepz.smooth.exception.InsertRecordException;
import com.mrgostepz.smooth.exception.RecordNotFoundException;
import com.mrgostepz.smooth.model.db.CategoryInfo;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryInfoService {

    private static final Logger logger = LogManager.getLogger(CategoryInfoService.class);

    private final CategoryInfoRepository categoryInfoRepository;

    public List<CategoryInfo> getAllCategoryInfo() {
        List<CategoryInfo> categoryInfoReList = categoryInfoRepository.getAll();
        if (categoryInfoReList == null) {
            throw new RecordNotFoundException("There is no record in categoryInfo table.");
        }
        logger.info(categoryInfoReList);
        return categoryInfoRepository.getAll();
    }

    public CategoryInfo getCategoryInfoById(int id) {
        CategoryInfo categoryInfo = categoryInfoRepository.getById(id);
        if (categoryInfo == null) {
            throw new RecordNotFoundException("There is no categoryInfo in this id.");
        }
        logger.info("CategoryInfo {}", categoryInfo);
        return categoryInfo;
    }

    public void addCategoryInfo(CategoryInfo categoryInfo) {
        int categoryInfoReId = categoryInfoRepository.add(categoryInfo);
        categoryInfo.setCategoryInfoId(categoryInfoReId);
        if (categoryInfoReId > 0) {
            logger.info("Add new categoryInfo Successfully: {}", categoryInfo);
        } else {
            logger.warn("Cannot add new categoryInfo: {}", categoryInfo);
            throw new InsertRecordException("Cannot Create");
        }
    }

    public void updateCategoryInfo(CategoryInfo categoryInfo) {
        if (Boolean.TRUE.equals(categoryInfoRepository.update(categoryInfo))) {
            logger.info("Update categoryInfo Successfully: {}", categoryInfo);
        } else {
            logger.warn("Cannot Update categoryInfo: {}", categoryInfo);
        }

    }

    public void deleteCategoryInfo(int id) {
        if (Boolean.TRUE.equals(categoryInfoRepository.deleteById(id))) {
            logger.info("Delete categoryInfo Successfully: {}", id);
        } else {
            logger.warn("Cannot Delete categoryInfo: {}", id);
        }
    }

}
