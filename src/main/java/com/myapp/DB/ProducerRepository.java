package com.myapp.DB;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by Bos on 2017-01-06.
 */
public interface ProducerRepository extends PagingAndSortingRepository<Producer, Long> {


}
