package com.travel.ata.controller;

import com.travel.ata.model.Passenger;
import com.travel.ata.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("payment")
public class PaymentController {
    @Autowired
    private PaymentService paymentService;

    @PostMapping("/pay")
    public ModelAndView processPayment(@ModelAttribute("passenger") Passenger passenger, Authentication auth) {
        Integer bookingId = paymentService.validatePayment(passenger,auth);
        ModelAndView modelAndView = new ModelAndView("paymentSuccess");
        modelAndView.addObject("bookingId", bookingId);
        return modelAndView;
    }
    
}
