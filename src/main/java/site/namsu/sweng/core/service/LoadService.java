package site.namsu.sweng.core.service;

import org.springframework.stereotype.Component;
import site.namsu.sweng.base.Dao;

import java.util.List;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-03 오후 10:38
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@SuppressWarnings("unchecked")
public class LoadService {

    public <T> List<T> load(Class<T> clazz) {
        Dao<T> dao = Dao.of(clazz);
        return dao.selectAll();
    }
}
