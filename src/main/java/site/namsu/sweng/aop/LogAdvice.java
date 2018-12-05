package site.namsu.sweng.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

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
public class LogAdvice {
    private BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(System.out));

    @Pointcut("within(site.namsu.sweng.core.publisher.*)")
    private void logPointcut() {
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

    @AfterReturning(value = "logPointcut()", argNames = "joinPoint")
    public void returnPublish(JoinPoint joinPoint) throws IOException {
        Date date = new Date();
        writer.write(date + " : 3. 발행 완료 : " + joinPoint.getSignature().toShortString() + "\n");
        writer.flush();
    }


    @AfterThrowing(value = "logPointcut()", argNames = "joinPoint")
    public void errorPublish(JoinPoint joinPoint) throws IOException {
        Date date = new Date();
        writer.write(date + " : #. 에러 발생 : " + joinPoint.getSignature().toShortString() + "\n");
        writer.flush();
    }
}

