package com.mrgostepz.smooth.db.repository;

import com.mrgostepz.smooth.model.db.TableInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface TableInfoRepository extends JpaRepository<TableInfo, Long> {
    //    public List<Expense> findByItem(String item);
//
//    @Query("SELECT e FROM Expense e WHERE e.amount >= :amount")
//    public List<Expense> listItemsWithPriceOver(@Param("amount") float amount);
//    @Modifying
//    @Query("UPDATE table_info AS ti SET ti.status = ?1 WHERE ti.name = ?2")
//    void updateTableInfoStatusByName(String status, String name);

    @Transactional
    @Modifying
    @Query("UPDATE table_info ti SET ti.status = :status WHERE ti.name = :name")
    void updateTableInfoStatusByName(@Param("status")String status, @Param("name")String name);
    List<TableInfo> findByName(String name);
}