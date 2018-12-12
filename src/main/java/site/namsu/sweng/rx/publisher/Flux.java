package site.namsu.sweng.rx.publisher;

import site.namsu.sweng.rx.subscription.Subscription;
import site.namsu.sweng.util.Pool;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Flow;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-03 오후 12:30
 * @Homepage : https://github.com/gusdnd852
 */
@SuppressWarnings("unchecked")
public class Flux<T> extends Publisher<T> {

    @SafeVarargs
    public static <T> Flux<T> main(T... inputs) {
        List<T> inputAsList = new ArrayList<>();
        for (T input : inputs) {
            if (input instanceof Iterable)
                for (T once : (Iterable<T>) input)
                    inputAsList.add(once);
            else inputAsList.add(input);
        }
        return new Flux<>() {
            @Override public void subscribe(Flow.Subscriber<? super T> subscriber) {
                Pool.main()
                        .execute(() -> subscriber.onSubscribe(new Subscription<>(subscriber, inputAsList)));
            }
        };
    }

    @SafeVarargs
    public static <T> Flux<T> background(T... inputs) {
        List<T> inputAsList = new ArrayList<>();
        for (T input : inputs) {
            if (input instanceof Iterable)
                for (T once : (Iterable<T>) input)
                    inputAsList.add(once);
            else inputAsList.add(input);
        }
        return new Flux<>() {
            @Override public void subscribe(Flow.Subscriber<? super T> subscriber) {
                Pool.randomExecutor()
                        .execute(() -> subscriber.onSubscribe(new Subscription<>(subscriber, inputAsList)));
            }
        };
    }
}
