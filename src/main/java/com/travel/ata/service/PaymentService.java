package com.travel.ata.service;

import com.travel.ata.model.Card;
import com.travel.ata.model.Passenger;
import com.travel.ata.model.Vehicle;
import com.travel.ata.repository.CardsRepository;
import com.travel.ata.repository.VehicleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class PaymentService {
    @Autowired
    private PassengerService passengerService;

    @Autowired
    private VehicleRepository vehicleRepository;
    @Autowired
    private CardsRepository cardsRepository;
    public Integer validatePayment(Passenger passenger, Authentication auth) {
        String username = null;
        if (auth.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) auth.getPrincipal();
            username = userDetails.getUsername();
        }
        passenger.getBooking().setBookedBy(username);
        Card card = passenger.getCard();
        Optional<Card> cardOptional = cardsRepository.findCardByCardNumberAndCvvAndExpiryDate(card.getCardNumber(), card.getCvv(), card.getExpiryDate());
        if (cardOptional.isPresent()) {
            Card cardDb = cardOptional.get();
            if(card.getCardNumber().equals(cardDb.getCardNumber())
                && card.getCvv().equals(cardDb.getCvv())
                && card.getExpiryDate().equals(cardDb.getExpiryDate())) {
                Vehicle vehicle = vehicleRepository.findVehicleByPlateNoEquals(passenger.getBooking().getVehicle().getPlateNo());
                passenger.getBooking().setVehicle(vehicle);
                passenger.getBooking().setStatus("BOOKED");
                Passenger savedPassenger = passengerService.create(passenger);
                return savedPassenger.getBooking().getId();
            }
        } else {
            throw new IllegalArgumentException("Card is invalid.");
        }


        return null;
    }
}
