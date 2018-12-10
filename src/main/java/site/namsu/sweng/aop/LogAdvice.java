package site.namsu.sweng.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import site.namsu.sweng.rx.publisher.Publisher;

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

    @Before(value = "logPointcut()", argNames = "joinPoint")
    public void beforePublish(JoinPoint joinPoint) {
        Date date = new Date();

        for (int i = 0; i < 200; i++) System.out.print('=');
        System.out.print('\n');
        System.out.println(date + " 발행 메소드 : " + joinPoint.getSignature().toShortString());
        System.out.println(date + " 사용자 입력 : " + Arrays.asList(joinPoint.getArgs()));
    }

    @Around(value = "logPointcut()")
    public Object publish(ProceedingJoinPoint pjp) throws Throwable {
        Date date = new Date();
        Publisher pjpPublisher = (Publisher) pjp.proceed();

        return pjpPublisher
                .next(input -> System.out.println(date + " 발행 쓰레드 : " + Thread.currentThread().getName()))
                .next(output -> System.out.println(date + " 발행 데이터 : " + output.toString()));
    }
}

