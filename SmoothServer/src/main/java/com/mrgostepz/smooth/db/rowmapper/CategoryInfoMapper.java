package com.mrgostepz.smooth.db.rowmapper;

import com.mrgostepz.smooth.model.db.CategoryInfo;
import com.mrgostepz.smooth.model.enumtype.Status;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.mrgostepz.smooth.db.ColumnName.*;

public class CategoryInfoMapper implements RowMapper<CategoryInfo> {
    @Override
    public CategoryInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
        CategoryInfo categoryInfo = new CategoryInfo();
        categoryInfo.setCategoryInfoId(rs.getInt(COL_CATEGORY_INFO_ID));
        categoryInfo.setName(rs.getString(COL_NAME));
        categoryInfo.setImagePath(rs.getString(COL_IMAGE_PATH));
        return categoryInfo;
    }
}
