package site.namsu.sweng.rx.util;

import java.util.concurrent.Flow;

/**
 * @Author : Hyunwoong
 * @When : 2018-12-02 오후 2:15
 * @Homepage : https://github.com/gusdnd852
 */
public class DelegateSubscriber implements Flow.Subscriber {

    private final long backPressure;

    public DelegateSubscriber(long backPressure) {
        this.backPressure = backPressure;
    }

    @Override public void onSubscribe(Flow.Subscription subscription) {
        subscription.request(backPressure);
    }

    @Override public void onNext(Object item) {

    }

    @Override public void onError(Throwable throwable) {

    }

    @Override public void onComplete() {

    }
}
