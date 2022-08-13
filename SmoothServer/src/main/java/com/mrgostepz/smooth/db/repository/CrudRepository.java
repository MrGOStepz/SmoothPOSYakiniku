package com.mrgostepz.smooth.db.repository;

import java.util.List;

public interface CrudRepository<T,I> {
   List<T> getAll();
   T getById(I id);
   Integer add(T t);
   Boolean update(T t);
   Boolean deleteById(I id);
}
