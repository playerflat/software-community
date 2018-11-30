package site.namsu.sweng.rx.operator;

import site.namsu.sweng.rx.publisher.Publisher;

import java.util.concurrent.Flow;
import site.namsu.sweng.rx.function.Function;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-28 오전 6:00
 * @Homepage : https://github.com/gusdnd852
 */
@SuppressWarnings("unchecked")
public class Switcher<T, R> extends Publisher<R> {

    private final Publisher<T> flux;
    private final Function<T, Function<T, R>> function;

    public Switcher(Publisher<T> flux, Function<T, Function<T, R>> function) {
        this.flux = flux;
        this.function = function;
    }

    @Override public void subscribe(Flow.Subscriber<? super R> subscriber) {
        flux.subscribe(new Flow.Subscriber<>() {
            @Override public void onSubscribe(Flow.Subscription subscription) {
                subscriber.onSubscribe(subscription);
            }

            @Override public void onNext(T item) {
                try {
                    subscriber.onNext(function.apply(item).apply(item));
                } catch (Exception e) {
                    subscriber.onError(e);
                }
            }

            @Override public void onError(Throwable throwable) {
                subscriber.onError(throwable);
            }

            @Override public void onComplete() {
                subscriber.onComplete();
            }
        });
    }
}
