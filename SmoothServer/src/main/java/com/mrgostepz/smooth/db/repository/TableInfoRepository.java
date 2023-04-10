package com.mrgostepz.smooth.db.repository;

import com.mrgostepz.smooth.model.db.TableCurrentState;
import com.mrgostepz.smooth.model.db.TableInfo;
import org.springframework.stereotype.Repository;


@Repository
public interface TableInfoRepository extends CrudRepository<TableInfo, Integer> {

}