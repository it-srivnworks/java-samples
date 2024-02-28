package com.srivn.works.codes.javasamples.basic;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class APITester {
    
 @GetMapping("/hello")
    public String hello() {
        return "Lets keep going!!";
    }
    
}
