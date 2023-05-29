package com.travel.ata.repository;

import com.travel.ata.model.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface BookingRepository extends JpaRepository<Booking,Integer> {

    Optional<List<Booking>> findByBookedBy(String username);
}
