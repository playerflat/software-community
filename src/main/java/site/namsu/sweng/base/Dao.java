package site.namsu.sweng.base;

import org.springframework.stereotype.Component;
import site.namsu.sweng.aop.LogAdvice;
import site.namsu.sweng.core.dao.BoardDao;
import site.namsu.sweng.core.dao.UserDao;
import site.namsu.sweng.core.entity.Board;
import site.namsu.sweng.core.entity.Notice;
import site.namsu.sweng.core.entity.User;
import site.namsu.sweng.util.Path;
import site.namsu.sweng.util.Pool;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Type;
import java.util.List;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-27 오전 1:05
 * @Homepage : https://github.com/gusdnd852
 */
@Component
@SuppressWarnings("unchecked")
public interface Dao<T> {

    T select(T input);

    List<T> selectAll();

    boolean insert(T input);

    boolean update(T input, String property, String value);

    boolean delete(T input);

    static <T> Dao of(T entity) {
        String className;
        synchronized (Pool.singleton()) {
            try {
                if (entity instanceof Class && ((Class) entity).getPackageName().equals(Path.entity))
                    className = ((Class) entity).getName().replace(Path.entity, Path.dao) + "Dao";

                else if (entity.getClass().getPackageName().equals(Path.entity))
                    className = entity.getClass().getName().replace(Path.entity, Path.dao) + "Dao";

                else throw new IllegalArgumentException("You can create dao class for only entity package class !");

                if (!Pool.singleton().containsKey(className))
                    Pool.singleton().put(className, Class.forName(className).getConstructor().newInstance());

                return (Dao) Pool.singleton().get(className);
            } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | NoSuchMethodException | InvocationTargetException e) {
                throw new IllegalArgumentException("Can not create Singleton Dao !");
            }
        }
    }
}