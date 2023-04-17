package com.mrgostepz.smooth.controller;


import com.mrgostepz.smooth.model.Products;
import com.mrgostepz.smooth.model.db.Product;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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

//    @GetMapping(path = "/")
//    @ResponseBody
//    public ResponseEntity<List<Product>> getProductById(@RequestParam String columnName, @RequestParam String value) {
//        List<Product> productList = productService.getProductByColumn(columnName, value);
//        return new ResponseEntity<>(productList, HttpStatus.OK);
//
//    }

    @PostMapping(path = "/add")
    @ResponseBody
    public ResponseEntity<String> addNewProduct(@RequestBody String jsonReq) {
        Product product = (Product) SmoothUtil.convertJsonToObject(jsonReq, Product.class);
        if (product == null) {
            return new ResponseEntity<>("Cannot Create Product", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        productService.addProduct(product);
        return new ResponseEntity<>(String.format("Add new product successfully: %s", product), HttpStatus.CREATED);
    }

//    @PostMapping(path = "/adds")
//    @ResponseBody
//    public ResponseEntity<String> addNewProducts(@RequestBody String jsonReq) {
//        List<Product> productList = (List<Product>) SmoothUtil.convertJsonToObject(jsonReq, Products.class);
//        if (productList == null) {
//            return new ResponseEntity<>("Cannot Create Product", HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//        for (Product product : productList) {
//            productService.addProduct(product);
//        }
//        return new ResponseEntity<>(String.format("Add new product successfully: %s", productList), HttpStatus.CREATED);
//    }

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
}
