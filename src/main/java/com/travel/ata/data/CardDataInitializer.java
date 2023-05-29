package com.travel.ata.data;

import com.travel.ata.model.Card;
import com.travel.ata.repository.CardsRepository;
import com.travel.ata.service.CardsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.ArrayList;

@Component
public class CardDataInitializer implements CommandLineRunner {

    @Autowired
    private CardsService cardsService;

    @Override
    public void run(String... args) {
        List<Card> cardList = new ArrayList<>();
        cardList.add(new Card(100.0, "1111222233334444", "12/25", "123"));
        cardList.add(new Card(200.0, "2222333344445555", "01/26", "456"));
        cardList.add(new Card(300.0, "3333444455556666", "02/27", "789"));
        cardList.add(new Card(400.0, "4444555566667777", "03/28", "012"));
        cardList.add(new Card(500.0, "5555666677778888", "04/29", "345"));
        cardList.add(new Card(600.0, "6666777788889999", "05/30", "678"));
        cardList.add(new Card(700.0, "7777888899990000", "06/31", "901"));
        cardList.add(new Card(800.0, "8888999900001111", "07/32", "234"));
        cardList.add(new Card(900.0, "9999000011112222", "08/33", "567"));
        cardList.add(new Card(1000.0, "0000111122223333", "09/34", "890"));
        cardsService.saveAllCards(cardList);
    }
}
