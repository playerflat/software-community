package site.namsu.sweng;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Configuration
@SpringBootApplication
public class SwengApplication {

    public static void main(String[] args) {
        SpringApplication.run(SwengApplication.class, args);
    }

    @Controller
    @Component
    public static class Main {
        @GetMapping("/")
        public String index() {
            return "index";
        }
    }
}