package com.travel.ata;

import com.travel.ata.model.Card;
import com.travel.ata.service.CardsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.ArrayList;

@SpringBootApplication
public class AtaApplication {

    public static void main(String[] args) {
        SpringApplication.run(AtaApplication.class, args);
    }

}
