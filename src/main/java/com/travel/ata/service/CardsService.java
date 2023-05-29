package com.travel.ata.service;

import com.travel.ata.model.Card;
import com.travel.ata.repository.CardsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardsService {
    @Autowired
    private CardsRepository cardsRepository;

    public void saveAllCards(List<Card> cardsList){
        cardsRepository.saveAll(cardsList);
    }

    public List<Card> getAllCards() {
        return cardsRepository.findAll();
    }

}
