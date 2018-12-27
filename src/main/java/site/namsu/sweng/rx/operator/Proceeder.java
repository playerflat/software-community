package site.namsu.sweng.rx.operator;

import site.namsu.sweng.rx.publisher.Publisher;

import java.util.concurrent.Flow;

import site.namsu.sweng.rx.function.Consumer;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-26 오전 11:23
 * @Homepage : https://github.com/gusdnd852
 */
@SuppressWarnings("unchecked")
public class Proceeder<T> extends Publisher<T> {
    private Publisher<T> publisher;
    private Consumer<T> consumer;

    public Proceeder(Publisher<T> publisher, Consumer<T> consumer) {
        this.publisher = publisher;
        this.consumer = consumer;
    }

    @Override public void subscribe(Flow.Subscriber<? super T> subscriber) {
        publisher.subscribe(new Flow.Subscriber<>() {
            @Override public void onSubscribe(Flow.Subscription subscription) {
                subscriber.onSubscribe(subscription);
            }

            @Override public void onNext(T item) {
                try {
                    consumer.accept(item);
                      subscriber.onNext(item);
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
