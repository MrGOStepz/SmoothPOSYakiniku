package com.mrgostepz.smooth.controller;

import com.mrgostepz.smooth.model.db.Product;
import com.mrgostepz.smooth.model.db.SetMenu;
import com.mrgostepz.smooth.service.ProductService;
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
    public ResponseEntity<String> addNewProduct(@RequestBody Product product) {
        productService.addProduct(product);
        return new ResponseEntity<>(String.format("Add new product successfully: %s", product.toString()), HttpStatus.CREATED);
    }

    @PutMapping(path = "/update")
    public String updateProduct(@RequestBody Product product) {
        productService.updateProduct(product);
        return String.format("Update Product: %s completed.", product);
    }

    @DeleteMapping("/{id}")
    public String deleteProduct(@PathVariable int id) {
        productService.deleteProduct(id);
        return String.format("Delete Product Id: %d completed.", id);
    }



}
