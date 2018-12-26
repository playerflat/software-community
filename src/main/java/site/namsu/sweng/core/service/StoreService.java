package site.namsu.sweng.core.service;

import org.springframework.stereotype.Component;
import site.namsu.sweng.base.Dao;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-04 오후 9:34
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@SuppressWarnings("unchecked")
public class StoreService {

    public <E> boolean storeSuccessful(E entity) {
        if (entity != null) {
            return Dao.of(entity)
                    .insert(entity);
        } else
            return false;
    }
}