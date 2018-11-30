package site.namsu.sweng.rx;

import site.namsu.sweng.rx.publisher.Publisher;
import site.namsu.sweng.rx.scheduler.Scheduler;

import java.util.concurrent.Flow;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-30 오후 1:34
 * @Homepage : https://github.com/gusdnd852
 */
public class Test {
    public static void main(String[] args) {
        Publisher.springThread(1)
                .next(input -> System.out.println("AA" + Thread.currentThread().getName()))
                .next(input -> System.out.println("AA" + Thread.currentThread().getName()))
                .subscribe(new Flow.Subscriber<Integer>() {
                    @Override public void onSubscribe(Flow.Subscription subscription) {

                    }

                    @Override public void onNext(Integer item) {

                    }

                    @Override public void onError(Throwable throwable) {

                    }

                    @Override public void onComplete() {

                    }
                });
    }
}
