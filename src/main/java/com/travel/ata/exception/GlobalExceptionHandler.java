package com.travel.ata.exception;

import com.travel.ata.model.User;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(IllegalArgumentException.class)
    public ModelAndView handleIllegalArgumentException(IllegalArgumentException ex) {
        ModelAndView modelAndView = new ModelAndView("error1");
        modelAndView.addObject("error", ex.getMessage());
        return modelAndView;
    }
}
