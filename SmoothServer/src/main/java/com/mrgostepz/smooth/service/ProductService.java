package com.mrgostepz.smooth.service;

import com.mrgostepz.smooth.db.repository.ProductRepository;
import com.mrgostepz.smooth.exception.InsertRecordException;
import com.mrgostepz.smooth.exception.RecordNotFoundException;
import com.mrgostepz.smooth.model.db.Product;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ProductService {

    private static final Logger logger = LogManager.getLogger(ProductService.class);

    private final ProductRepository productRepository;

    private Map<Integer, Product> products = new HashMap<>();
    private List<Product> productList = new ArrayList<>();

    @Autowired
    public void init() {
        productList = productRepository.getAll();
        updateProductCache(productList);
    }

    public List<Product> getProductFromCache() {
        return productList;
    }

    private void updateProductCache(List<Product> productList) {
        for (Product product : productList) {
            products.put(product.getId(), product);
        }
    }

    public Product getProductByCache(int id) {
        return products.get(id);
    }

    public List<Product> getAllProduct() {
        List<Product> productList = productRepository.getAll();
        updateProductCache(productList);
        if (productList == null) {
            throw new RecordNotFoundException("There is no record in product table.");
        }
        logger.info(productList);
        return productRepository.getAll();
    }

    public Product getProductById(int id) {
        Product product = productRepository.getById(id);
        if (product == null) {
            throw new RecordNotFoundException("There is no product in this id.");
        }
        logger.info("Product {}", product);
        return product;
    }

    public void addProduct(Product product) {
        int productId = productRepository.add(product);
        product.setId(productId);
        if (productId > 0) {
            logger.info("Add new product Successfully: {}", product);
        } else {
            logger.warn("Cannot add new product: {}", product);
            throw new InsertRecordException("Cannot Create a Product");
        }
    }

    public void updateProduct(Product product) {
        if (Boolean.TRUE.equals(productRepository.update(product))) {
            logger.info("Update product Successfully: {}", product);
        } else {
            logger.warn("Cannot Update product: {}", product);
        }

    }

    public void deleteProduct(int id) {
        if (Boolean.TRUE.equals(productRepository.deleteById(id))) {
            logger.info("Delete product Successfully: {}", id);
        } else {
            logger.warn("Cannot Delete product: {}", id);
        }
    }

    public List<Product> getProductByColumn(String column, String value) {
        List<Product> customerList = productRepository.getProductInfoByColumn(column, value);
        if (customerList == null) {
            throw new RecordNotFoundException("There is no customer in this column.");
        }
        Product customer = customerList.get(0);
        logger.info("Product {}", customer);
        return customerList;
    }
}
