package com.mrgostepz.smooth.until;

import com.mrgostepz.smooth.model.TableInfo;
import com.mrgostepz.smooth.model.db.Product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SmoothCache {
    public static Map<Integer, Product> productMap = new HashMap<>();
    public static Map<Integer, TableInfo> tableInfoMap = new HashMap<>();
}
