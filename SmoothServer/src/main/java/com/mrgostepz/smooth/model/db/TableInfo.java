package com.mrgostepz.smooth.model.db;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity(name = "table_info")
public class TableInfo {
//    @Id
//    @SequenceGenerator(
//            name = "table_info_sequence",
//            sequenceName = "table_current_state_sequence",
//            allocationSize = 1
//    )
//    @GeneratedValue(
//            strategy = GenerationType.SEQUENCE,
//            generator = "table_current_state_sequence"
//    )
//    @Column(
//            name = "id",
//            updatable = false
//    )

    @Id
    private String name;
    private String status;
}
