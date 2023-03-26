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
        CategoryInfo CategoryInfo = new CategoryInfo();
        CategoryInfo.setCategoryInfoId(rs.getInt(COL_CATEGORY_INFO_ID));
        CategoryInfo.setName(rs.getString(COL_NAME));
        return CategoryInfo;
    }
}
