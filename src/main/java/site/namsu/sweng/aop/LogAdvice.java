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

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
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
public class LogAdvice implements Cloneable {
    private BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(System.out));

    @Pointcut("within(site.namsu.sweng.core.publisher.*)")
    private void logPointcut() {
    }

    @Around("logPointcut()")
    public Object log(ProceedingJoinPoint pjp) {
        Date date = new Date();

        try {
            Publisher result = (Publisher) pjp.proceed();
            result.next(input -> writer.write(date + " : 3. 발행 쓰레드 : " + Thread.currentThread().getName() + "\n"))
                    .next(output -> writer.write(date + " : 4. 발행 데이터 : " + output + "\n"))
                    .error(error -> writer.write(date + " : #. 에러 발생" + ((Throwable) error).getMessage() + "\n"))
                    .subscribe(new DelegateSubscriber(Long.MAX_VALUE));
            writer.flush();
            return result;
        } catch (Throwable throwable) {
            return null;
        }
    }

    @Before(value = "logPointcut()", argNames = "joinPoint")
    public void beforePublish(JoinPoint joinPoint) throws IOException {
        Date date = new Date();

        for (int i = 0; i < 200; i++) writer.write('=');
        writer.write('\n');
        writer.write(date + " : 1. 발행 메소드 : " + joinPoint.getSignature().toShortString() + "\n");
        writer.write(date + " : 2. 사용자 입력 : " + Arrays.asList(joinPoint.getArgs()) + "\n");
        writer.flush();
    }
}

