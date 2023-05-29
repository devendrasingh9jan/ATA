package com.travel.ata.repository;

import com.travel.ata.model.User;
import com.travel.ata.model.Vehicle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VehicleRepository extends JpaRepository<Vehicle,Integer> {
    Vehicle findVehicleByPlateNoEquals(String plateNo);
}
