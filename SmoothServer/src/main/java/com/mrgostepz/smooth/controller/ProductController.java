package com.mrgostepz.smooth.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mrgostepz.smooth.model.db.Product;
import com.mrgostepz.smooth.model.enumtype.FoodType;
import com.mrgostepz.smooth.service.ProductService;
import com.mrgostepz.smooth.until.SmoothUtil;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

import static com.mrgostepz.smooth.model.constraint.JsonKey.*;

//https://mkyong.com/spring-boot/spring-rest-error-handling-example/
//http://localhost:8080/spring-mvc-basics/foos?id=abc
// @RequestParam means it is a parameter from the GET or POST request

@RestController
@RequiredArgsConstructor
@RequestMapping(path = "api/v1/product")
class ProductController {

    private static final Logger logger = LogManager.getLogger(ProductController.class);

    private final ProductService productService;

    @GetMapping(path = "/all")
    @ResponseBody
    public ResponseEntity<List<Product>> getAllProduct() {
        return new ResponseEntity<>(productService.getAllProduct(), HttpStatus.OK);
    }

    @GetMapping(path = "/{id}")
    @ResponseBody
    public ResponseEntity<Product> getProductById(@PathVariable int id) {
        Product product = productService.getProductById(id);
        return new ResponseEntity<>(product, HttpStatus.OK);
    }

    @GetMapping(path = "/")
    @ResponseBody
    public ResponseEntity<List<Product>> getProductById(@RequestParam String columnName, @RequestParam String value) {
        List<Product> productList = productService.getProductByColumn(columnName, value);
        return new ResponseEntity<>(productList, HttpStatus.OK);

    }

    @PostMapping(path = "/add")
    @ResponseBody
    public ResponseEntity<String> addNewProduct(@RequestBody String jsonReq) {
//        Product product = convertJsonToProduct(jsonReq);
        Product product = (Product) SmoothUtil.convertJsonToObject(jsonReq, Product.class);
        if (product == null) {
            return new ResponseEntity<>("Cannot Create Product", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        productService.addProduct(product);
        return new ResponseEntity<>(String.format("Add new product successfully: %s", product), HttpStatus.CREATED);
    }

    @PutMapping(path = "/update")
    public String updateProduct(@RequestBody String jsonReq) {
        Product product = (Product) SmoothUtil.convertJsonToObject(jsonReq, Product.class);
        productService.updateProduct(product);
        return String.format("Update Product: %s completed.", product);
    }

    @DeleteMapping("/{id}")
    public String deleteProduct(@PathVariable int id) {
        productService.deleteProduct(id);
        return String.format("Delete Product Id: %d completed.", id);
    }

    private Product convertJsonToProduct(String json){
        try {
            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> map = mapper.readValue(json, Map.class);
            Product product = new Product();
            product.setId((Integer) map.get(ID));
            product.setName((String) map.get(NAME));
            product.setDescription((String) map.get(DESCRIPTION));
            product.setPrice((Double) map.get(PRICE));
            product.setFoodType(FoodType.fromString((String) map.get(FOOD_TYPE)));
            product.setCategoryId((Integer) map.get(CATEGORY_ID));
            product.setLocationPage((Integer) map.get(LOCATION_PAGE));
            product.setLocationRow((Integer) map.get(LOCATION_ROW));
            product.setLocationColumn((Integer) map.get(LOCATION_COLUMN));
            product.setImagePath((String) map.get(IMAGE_PATH));
            product.setStock((Integer) map.get(STOCK));
            product.setIsAvailable(map.get(IS_AVAILABLE).equals(1));
            return product;
        } catch (Exception ex) {
            logger.error(ex.getMessage());
            return null;
        }
    }


}
