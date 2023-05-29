package com.travel.ata.service;

import com.travel.ata.exception.ResourceNotFound;
import com.travel.ata.model.Booking;
import com.travel.ata.model.Passenger;
import com.travel.ata.model.Passenger;
import com.travel.ata.model.Vehicle;
import com.travel.ata.repository.BookingRepository;
import com.travel.ata.repository.PassengerRepository;
import com.travel.ata.repository.VehicleRepository;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class PassengerService {

    @Autowired
    private PassengerRepository passengerRepository;
    @Autowired
    private VehicleRepository vehicleRepository;
    @Autowired
    private BookingRepository bookingRepository;

    public Passenger create(Passenger passenger) {
        String plateNo = passenger.getBooking().getVehicle().getPlateNo();
        Vehicle vehicle = vehicleRepository.findVehicleByPlateNoEquals(plateNo);
        passenger.getBooking().setVehicle(vehicle);
        Passenger savedPassenger = null;
        if(vehicle.getTravelDate().equals(passenger.getTravellingDate())){
            passenger.getBooking().setBookingDate(passenger.getTravellingDate());
            passenger.getBooking().setSource(passenger.getSource());
            passenger.getBooking().setDestination(passenger.getDestination());
            if(Objects.nonNull(passenger.getPaidAmount()) && passenger.getPaidAmount().equals(vehicle.getPrice())){
                passenger.getBooking().setStatus("BOOKED");
                savedPassenger = passengerRepository.save(passenger);
            } else {
                throw new IllegalArgumentException("Amount not paid");
            }
        } else{
            throw new IllegalArgumentException("Vehicle not available for Date: "+passenger.getTravellingDate());
        }
        return savedPassenger;
    }

    public Passenger getPassenger(Integer passengerId) throws Exception {
        Passenger passenger = passengerRepository.findById(passengerId).orElseThrow(() -> new ResourceNotFound("Passenger not found with id: " + passengerId));
        return passenger;
    }

    public List<Passenger> getAllPassengers() {
        return passengerRepository.findAll();
    }
    public List<Passenger> getPassengers(String plateNo) {
        ArrayList<Passenger> passengers = new ArrayList<>();
        for (Passenger passenger : getAllPassengers()) {
            if(Objects.nonNull(passenger.getBooking())
                    && Objects.nonNull(passenger.getBooking().getVehicle())
                    && passenger.getBooking().getVehicle().getPlateNo().equals(plateNo)){
                passengers.add(passenger);
            }

        }
        return passengers;
    }

    public void cancelBooking(Integer bookingId) {
        bookingRepository.findById(bookingId).ifPresent(booking -> {
            booking.setStatus("CANCELLED");
            bookingRepository.save(booking);
        });
    }

    public void generateBookingReceipt(Integer bookingId, Authentication auth, HttpServletResponse response) throws IOException {
        Optional<Booking> bookingOptional = bookingRepository.findById(bookingId);
        if (bookingOptional.isPresent()) {
            Booking booking = bookingOptional.get();

            // Create a new PDF document
            PDDocument document = new PDDocument();
            PDPage page = new PDPage(PDRectangle.A4);
            document.addPage(page);

            // Create a new content stream
            PDPageContentStream contentStream = new PDPageContentStream(document, page);

            // Set the font and font size for the content
            contentStream.setFont(PDType1Font.HELVETICA_BOLD, 12);

            // Set the starting position for the content
            float y = page.getMediaBox().getHeight() - 50;

            // Write the booking details to the content stream
            contentStream.beginText();
            contentStream.newLineAtOffset(50, y);
            contentStream.showText("Booking ID: " + booking.getId());
            contentStream.newLine();
            y -= 20;
            contentStream.newLineAtOffset(0, -20);
            contentStream.showText("Booking Date: " + booking.getBookingDate());
            contentStream.newLine();
            y -= 20;
            contentStream.newLineAtOffset(0, -20);
            contentStream.showText("Source: " + booking.getSource());
            contentStream.newLine();
            y -= 20;
            contentStream.newLineAtOffset(0, -20);
            contentStream.showText("Destination: " + booking.getDestination());
            contentStream.newLine();
            y -= 20;
            contentStream.newLineAtOffset(0, -20);
            contentStream.showText("Status: " + booking.getStatus());
            contentStream.newLine();
            y -= 20;
            contentStream.newLineAtOffset(0, -20);
            contentStream.showText("Vehicle No: " + booking.getVehicle().getPlateNo());
            contentStream.newLine();
            y -= 20;
            contentStream.newLineAtOffset(0, -20);
            contentStream.showText("Vehicle Type: " + booking.getVehicle().getType());
            contentStream.newLine();
            y -= 20;
            contentStream.newLineAtOffset(0, -20);
            contentStream.showText("Ticket Price: " + booking.getVehicle().getPrice());
            // Add more booking details here as needed
            contentStream.endText();

            // Close the content stream
            contentStream.close();

            // Set the response headers for the PDF file
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "inline; filename=booking_receipt.pdf");

            // Save the PDF document to the response output stream
            document.save(response.getOutputStream());

            // Close the PDF document
            document.close();
        }
    }

}
