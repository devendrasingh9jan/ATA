package com.travel.ata.repository;

import com.travel.ata.model.Passenger;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PassengerRepository extends JpaRepository<Passenger,Integer> {
}
