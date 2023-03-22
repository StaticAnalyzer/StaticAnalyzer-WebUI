package com.staticanalyzer.staticanalyzer;

import com.staticanalyzer.staticanalyzer.algoservice.AlgorithmService;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
public class AlgorithmServiceTests {
    @Autowired
    private AlgorithmService algorithmService;

    @Test
    public void TestConnection(){
//        System.out.println(algorithmService.JustReturn("".getBytes()));
    }
}
