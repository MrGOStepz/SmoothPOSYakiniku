package com.mrgostepz.smooth.controller;

import com.mrgostepz.smooth.model.db.CategoryInfo;
import com.mrgostepz.smooth.service.CategoryInfoService;
import com.mrgostepz.smooth.until.SmoothUtil;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


//https://mkyong.com/spring-boot/spring-rest-error-handling-example/
//http://localhost:8080/spring-mvc-basics/foos?id=abc
// @RequestParam means it is a parameter from the GET or POST request

@RestController
@RequiredArgsConstructor
@RequestMapping(path = "api/v1/categoryInfo")
class CategoryInfoController {

    private static final Logger logger = LogManager.getLogger(CategoryInfoController.class);

    private final CategoryInfoService categoryInfoService;

    @GetMapping(path = "/all")
    @ResponseBody
    public ResponseEntity<List<CategoryInfo>> getAllCategoryInfo() {
        return new ResponseEntity<>(categoryInfoService.getAllCategoryInfo(), HttpStatus.OK);
    }

    @GetMapping(path = "/{id}")
    @ResponseBody
    public ResponseEntity<CategoryInfo> getCategoryInfoById(@PathVariable int id) {
        CategoryInfo categoryInfo = categoryInfoService.getCategoryInfoById(id);
        return new ResponseEntity<>(categoryInfo, HttpStatus.OK);
    }

    @PostMapping(path = "/add")
    @ResponseBody
    public ResponseEntity<String> addNewCategoryInfo(@RequestBody String jsonReq) {
        CategoryInfo categoryInfo = (CategoryInfo) SmoothUtil.convertJsonToObject(jsonReq, CategoryInfo.class);
        categoryInfoService.addCategoryInfo(categoryInfo);
        return new ResponseEntity<>(String.format("Add new categoryInfo successfully: %s", categoryInfo.toString()), HttpStatus.CREATED);
    }

    @PutMapping(path = "/update")
    public String updateCategoryInfo(@RequestBody String jsonReq) {
        CategoryInfo categoryInfo = (CategoryInfo) SmoothUtil.convertJsonToObject(jsonReq, CategoryInfo.class);
        categoryInfoService.updateCategoryInfo(categoryInfo);
        return String.format("Update CategoryInfo: %s completed.", categoryInfo);
    }

    @DeleteMapping("/{id}")
    public String deleteCategoryInfo(@PathVariable int id) {
        categoryInfoService.deleteCategoryInfo(id);
        return String.format("Delete CategoryInfo Id: %d completed.", id);
    }

}
