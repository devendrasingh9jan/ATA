package com.travel.ata.service;

import com.travel.ata.exception.ResourceNotFound;
import com.travel.ata.model.Booking;
import com.travel.ata.model.Vehicle;
import com.travel.ata.repository.BookingRepository;
import com.travel.ata.repository.VehicleRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class VehicleService {

    @Autowired
    private VehicleRepository vehicleRepository;

    @Autowired
    private BookingRepository bookingRepository;

    @Autowired
    public VehicleService(VehicleRepository vehicleRepository) {
        this.vehicleRepository = vehicleRepository;
    }

    public Vehicle create(Vehicle vehicle) {
        if (isVehicleExists(vehicle.getPlateNo(),vehicle.getTravelDate())) {
            throw new IllegalArgumentException("Vehicle already exists");
        }
        return vehicleRepository.save(vehicle);
    }

    private boolean isVehicleExists(String plateNo, String travelDate) {
        Vehicle existingVehicle = vehicleRepository.findVehicleByPlateNoEquals(plateNo);
        if(Objects.nonNull(existingVehicle)
                && StringUtils.equals(plateNo,existingVehicle.getPlateNo())
                && StringUtils.equals(travelDate,existingVehicle.getTravelDate())){
            return true;
        }
        return false;
    }

    public Vehicle getVehicle(Integer vehicleId) throws Exception {
        Vehicle vehicle = vehicleRepository.findById(vehicleId).orElseThrow(() -> new ResourceNotFound("Vehicle not found with id: " + vehicleId));
        return vehicle;
    }

    public void deleteVehicle(Integer id) throws Exception {
        Optional<Vehicle> optionalVehicle = vehicleRepository.findById(id);
        if (optionalVehicle.isPresent()) {
            vehicleRepository.deleteById(id);
        } else {
            throw new Exception("Vehicle not found to delete");
        }
    }

    public Vehicle update(Vehicle vehicle) throws Exception {
        Optional<Vehicle> optionalVehicle = vehicleRepository.findById(vehicle.getId());
        if (optionalVehicle.isPresent()) {
            vehicleRepository.save(vehicle);
        } else {
            throw new ResourceNotFound("Vehicle not found with id: "+ vehicle.getPlateNo());
        }
        return vehicle;
    }

    public List<Vehicle> getAllVehicles() {
        return vehicleRepository.findAll();
    }

    public List<Booking> getAllVehiclesBookings(Authentication auth) {
        String username = null;
        if (auth.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) auth.getPrincipal();
            username = userDetails.getUsername();
        }
        Optional<List<Booking>> bookingOptional = bookingRepository.findByBookedBy(username);
        List<Booking> bookings = null;
        if (bookingOptional.isPresent()) {
            bookings = bookingOptional.get();
        }
        return bookings;
    }
}
