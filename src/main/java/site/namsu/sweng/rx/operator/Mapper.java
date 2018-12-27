package site.namsu.sweng.rx.operator;

import site.namsu.sweng.rx.function.Function;
import site.namsu.sweng.rx.publisher.Publisher;

import java.util.concurrent.Flow;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-26 오전 7:22
 * @Homepage : https://github.com/gusdnd852
 */
@SuppressWarnings("unchecked")
public class Mapper<T, R> extends Publisher<R> {

    private final Publisher<T> publisher;
    private final Function<T, R> function;

    public Mapper(Publisher<T> publisher, Function<T, R> function) {
        this.publisher = publisher;
        this.function = function;
    }

    @Override public void subscribe(Flow.Subscriber<? super R> subscriber) {
        publisher.subscribe(new Flow.Subscriber<>() {
            @Override public void onSubscribe(Flow.Subscription subscription) {
                subscriber.onSubscribe(subscription);
            }

            @Override public void onNext(T item) {
                try {
                    subscriber.onNext(function.apply(item));
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
