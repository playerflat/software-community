package site.namsu.sweng.rx.operator;

import site.namsu.sweng.rx.publisher.Publisher;

import java.util.concurrent.Flow;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-25 오후 11:07
 * @Homepage : https://github.com/gusdnd852
 */
public class Runner<T> extends Publisher<T> {
    private Publisher<T> publisher;
    private Runnable runnable;

    public Runner(Publisher<T> publisher, Runnable runnable) {
        this.publisher = publisher;
        this.runnable = runnable;
    }

    @Override public void subscribe(Flow.Subscriber<? super T> subscriber) {
        publisher.subscribe(new Flow.Subscriber<>() {
            @Override public void onSubscribe(Flow.Subscription subscription) {
                subscriber.onSubscribe(subscription);
            }

            @Override public void onNext(T item) {
                try {
                    runnable.run();
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
