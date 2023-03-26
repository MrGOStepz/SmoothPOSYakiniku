package com.mrgostepz.smooth.model;

import com.mrgostepz.smooth.model.db.Product;
import lombok.Data;

import java.util.List;

@Data
public class Products {
    List<Product> products;
}
