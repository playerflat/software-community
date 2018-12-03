package site.namsu.sweng.base;

import org.springframework.stereotype.Component;
import site.namsu.sweng.util.Pool;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-27 오전 1:05
 * @Homepage : https://github.com/gusdnd852
 */
@Component
public interface Dao<T> {

    T select(T input);

    List<T> selectAll();

    boolean insert(T input);

    boolean update(T input, String property, String value);

    boolean delete(T input);

    static <T extends Dao> T of(Class<T> clazz) {
        synchronized (Pool.singleton()) {
            try {
                if (!Pool.singleton().containsKey(clazz.getName())) {
                    Pool.singleton().put(clazz.getName(), clazz.getConstructor().newInstance());
                }
                return (T) Pool.singleton().get(clazz.getName());
            } catch (InstantiationException | IllegalAccessException |
                    NoSuchMethodException | InvocationTargetException e) {
                throw new NullPointerException("싱글톤 생성 불가");
            }
        }
    }
}
