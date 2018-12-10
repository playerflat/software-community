package site.namsu.sweng.util;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-27 오전 3:22
 * @Homepage : https://github.com/gusdnd852
 */
public class Pool {
    private static final Map<String, Object> singletonPool = new ConcurrentHashMap<>();
    private static final Executor mainThread = Runnable::run;
    private static final Executor backgroundThread = Executors.newCachedThreadPool();

    public static Map<String, Object> singleton() {
        return singletonPool;
    }

    public static Executor background() {
        return backgroundThread;
    }

    public static Executor main() {
        return mainThread;
    }
}
