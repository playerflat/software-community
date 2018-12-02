package site.namsu.sweng.aop;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import site.namsu.sweng.rx.publisher.Publisher;
import site.namsu.sweng.rx.util.DelegateSubscriber;

import java.util.Arrays;
import java.util.Date;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-30 오후 11:15
 * @Homepage : https://github.com/gusdnd852
 */
@Aspect
@Component
@SuppressWarnings("unchecked")
public class LogAdvice {

    @Pointcut("within(site.namsu.sweng.core.publisher.*)")
    private void logPointcut() {
    }

    @Around("logPointcut()")
    public Object log(ProceedingJoinPoint pjp) {
        try {
            Date date = new Date();
            Publisher result = (Publisher) pjp.proceed();
            result.next(input -> System.out.println(date + " : 발행 쓰레드 : " + Thread.currentThread().getName()))
                    .next(output -> System.out.println(date + " : 발행 데이터 : " + output))
                    .error(error -> System.out.println(date + " : 에러 발생" + ((Throwable) error).getMessage()))
                    .subscribe(new DelegateSubscriber(Long.MAX_VALUE));
            return result;
        } catch (Throwable throwable) {
            return null;
        }
    }

    @Before(value = "logPointcut()", argNames = "joinPoint")
    public void beforePublish(JoinPoint joinPoint) {
        Date date = new Date();
        System.out.println(date + " : 발행 메소드 : " + joinPoint.getSignature().toShortString());
        System.out.println(date + " : 사용자 입력 : " + Arrays.asList(joinPoint.getArgs()));
    }
}

