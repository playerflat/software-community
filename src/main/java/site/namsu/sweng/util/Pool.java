package site.namsu.sweng.util;

import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Vector;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-27 오전 3:22
 * @Homepage : https://github.com/gusdnd852
 */
public class Pool {
    private static final Map<String, Object> singletonPool = new ConcurrentHashMap<>();
    private static final Executor mainThread = Runnable::run;
    private static final List<Executor> backgroundThread = new Vector<>();
    private static final Random random = new Random();

    public static Map<String, Object> singleton() {
        return singletonPool;
    }

    public static List<Executor> background() {
        return backgroundThread;
    }

    public static Executor randomExecutor() {
        return backgroundThread.get(random.nextInt(15));
    }


    public static Executor main() {
        return mainThread;
    }
}