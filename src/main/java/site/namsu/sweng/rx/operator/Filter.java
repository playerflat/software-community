package site.namsu.sweng.rx.operator;

import site.namsu.sweng.rx.function.Predicate;
import site.namsu.sweng.rx.publisher.Publisher;

import java.util.concurrent.Flow;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-26 오전 9:05
 * @Homepage : https://github.com/gusdnd852
 */
@SuppressWarnings("unchecked")
public class Filter<T> extends Publisher<T> {

    private final Predicate<T> predicate;
    private final Publisher<T> publisher;

    public Filter(Publisher<T> publisher, Predicate<T> predicate) {
        this.publisher = publisher;
        this.predicate = predicate;
    }

    @Override public void subscribe(Flow.Subscriber<? super T> subscriber) {
        publisher.subscribe(new Flow.Subscriber<>() {
            @Override public void onSubscribe(Flow.Subscription subscription) {
                subscriber.onSubscribe(subscription);
            }

            @Override public void onNext(T item) {
                try {
                    if (predicate.test(item)) {
                        subscriber.onNext(item);
                    } else {
                        subscriber.onComplete();
                    }
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
