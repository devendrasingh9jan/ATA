package com.travel.ata.repository;

import com.travel.ata.model.Card;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CardsRepository extends JpaRepository<Card,Integer> {
    Optional<Card> findCardByCardNumberAndCvvAndExpiryDate(String cardNumber,String cvv, String expiryDate);
}
