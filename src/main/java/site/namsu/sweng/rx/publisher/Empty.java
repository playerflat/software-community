package site.namsu.sweng.rx.publisher;

import site.namsu.sweng.rx.subscription.Subscription;
import site.namsu.sweng.util.Pool;

import java.util.Collections;
import java.util.concurrent.Flow;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-03 오후 12:19
 * @Homepage : https://github.com/gusdnd852
 */
@SuppressWarnings("unchecked")
public class Empty<T> extends Publisher<T> {
    public static <T> Empty<T> main() {
        return new Empty<>() {
            @Override public void subscribe(Flow.Subscriber<? super T> subscriber) {
                Pool.main()
                        .execute(() -> subscriber.onSubscribe(new Subscription<>(subscriber, Collections.singletonList((T) "EMPTY INPUT"))));
            }
        };
    }

    public static <T> Empty<T> background() {
        return new Empty<>() {
            @Override public void subscribe(Flow.Subscriber<? super T> subscriber) {
                Pool.background()
                        .execute(() -> subscriber.onSubscribe(new Subscription<>(subscriber, Collections.singletonList((T) "EMPTY INPUT"))));
            }
        };
    }
}
