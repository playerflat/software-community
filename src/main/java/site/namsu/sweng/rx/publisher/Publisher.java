package site.namsu.sweng.rx.publisher;

import site.namsu.sweng.rx.function.BiFunction;
import site.namsu.sweng.rx.function.Consumer;
import site.namsu.sweng.rx.function.Function;
import site.namsu.sweng.rx.function.Predicate;
import site.namsu.sweng.rx.operator.*;
import site.namsu.sweng.rx.operator.Error;

import java.util.concurrent.Flow;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-26 오전 7:20
 * @Homepage : https://github.com/gusdnd852
 */
@SuppressWarnings("unchecked")
public class Publisher<T> implements Flow.Publisher<T> {
    protected Publisher() {
    }

    public <R> Publisher<R> map(Function<T, R> function) {
        return new Mapper<>(this, function);
    }

    public <R> Publisher<R> reduce(R init, BiFunction<R, T, R> biFunction) {
        return new Reducer<>(this, init, biFunction);
    }

    public Publisher<T> filter(Predicate<T> predicate) {
        return new Filter<>(this, predicate);
    }

    public Publisher<T> next(Consumer<T> consumer) {
        return new Proceeder<>(this, consumer);
    }

    public Publisher<T> run(Runnable runnable) {
        return new Runner<>(this, runnable);
    }

    public <R> Publisher<Publisher<R>> flatMap(Function<T, Publisher<R>> flatMapper) {
        return new Flatter<>(this, flatMapper);
    }

    @Override public void subscribe(Flow.Subscriber<? super T> subscriber) {
    }

    public Publisher<T> error(Consumer<Throwable> consumer) {
        return new Error<>(this, consumer);
    }

    public Publisher<T> complete(Runnable runnable) {
        return new Complete<>(this, runnable);
    }
}