package com.travel.ata.controller;

import com.travel.ata.model.Booking;
import com.travel.ata.model.Passenger;
import com.travel.ata.model.UserDetailsImpl;
import com.travel.ata.model.Vehicle;
import com.travel.ata.service.PassengerService;
import com.travel.ata.service.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("passenger")
public class PassengerController{
    @Autowired
    private PassengerService passengerService;

    @Autowired
    private VehicleService vehicleService;

    @PostMapping("create")
    public Passenger create(@ModelAttribute("passenger") Passenger passenger){
        return passengerService.create(passenger);
    }

    @GetMapping("{id}")
    public Passenger getPassenger(@PathVariable Integer id) throws Exception {
        return passengerService.getPassenger(id);
    }

    @GetMapping("/vehicle/all")
    public ModelAndView getAllVehicles() {
        List<Vehicle> vehicles = vehicleService.getAllVehicles();
        return new ModelAndView("view-user-vehicles", "vehicleList", vehicles);
    }

    @GetMapping(value = "/book/vehicle")
    public ModelAndView bookVehicle(@RequestParam Integer vehicleId, Authentication auth) throws Exception {
        Vehicle vehicle = vehicleService.getVehicle(vehicleId);
        Passenger passenger = new Passenger();
        passenger.setTravellingDate(vehicle.getTravelDate());
        Booking booking = new Booking();
        booking.setVehicle(vehicle);
        passenger.setBooking(booking);
        return new ModelAndView("bookVehicle", "passenger", passenger);
    }

    @GetMapping(value = "/cancel/booking")
    public String cancelPassengerBooking(@RequestParam Integer bookingId,Authentication auth){
        passengerService.cancelBooking(bookingId);
        return "redirect:/passenger/status";
    }

    @GetMapping("status")
    public ModelAndView getBookings(Authentication auth) {
        List<Booking> bookings = vehicleService.getAllVehiclesBookings(auth);
        return new ModelAndView("view-booking", "bookings", bookings);
    }

    @GetMapping("vehicle/{plateNo}")
    public List<Passenger> getPassengers(@PathVariable String plateNo){
        return passengerService.getPassengers(plateNo);
    }

    @GetMapping(value = "vehicle")
    public ModelAndView getPassengers() {
        List<Passenger> passengers = passengerService.getAllPassengers();
        return new ModelAndView("view-passengers", "passengers", passengers);
    }

    @GetMapping("/booking/receipt")
    public void generateReceipt(@RequestParam Integer bookingId, Authentication auth, HttpServletResponse response) throws IOException, IOException {
        passengerService.generateBookingReceipt(bookingId,auth,response);
    }

}
