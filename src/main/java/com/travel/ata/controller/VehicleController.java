package com.travel.ata.controller;

import com.travel.ata.model.Vehicle;
import com.travel.ata.service.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("vehicle")
public class VehicleController {
    @Autowired
    private VehicleService vehicleService;

    @PostMapping("create")
    public String create(@ModelAttribute("vehicle") Vehicle vehicle,Authentication auth) {
        vehicleService.create(vehicle);
        return "redirect:/all";
    }

    @GetMapping(value = "create")
    public ModelAndView createVehicle(@ModelAttribute("vehicle") Vehicle vehicle,Authentication auth) {
        return new ModelAndView("create-vehicle", "vehicle", new Vehicle());
    }

    @RequestMapping(value = "update", method = RequestMethod.GET)
    public ModelAndView editVehicle(@RequestParam("id") Integer id,Authentication auth) throws Exception {
        Vehicle vehicle = vehicleService.getVehicle(id);
        return new ModelAndView("create-vehicle", "vehicle", vehicle);
    }

    @PostMapping("/save")
    public String saveVehicle(@ModelAttribute("vehicle") Vehicle vehicle,Authentication auth) throws Exception {
        if (vehicle.getId() != null) {
            vehicleService.update(vehicle);
        } else {
            vehicleService.create(vehicle);
        }
        return "redirect:/vehicle/all";
    }

    @GetMapping("{id}")
    public Vehicle getVehicle(@PathVariable Integer id) throws Exception {
        return vehicleService.getVehicle(id);
    }

    @GetMapping("all")
    public ModelAndView getAllVehicles(Authentication auth) {
        List<Vehicle> vehicles = vehicleService.getAllVehicles();
        return new ModelAndView("view-vehicle", "vehicleList", vehicles);
    }

    @RequestMapping(value = "delete", method = RequestMethod.DELETE)
    public String deleteVehicle(@RequestParam Integer id,Authentication auth) throws Exception {
        vehicleService.deleteVehicle(id);
        return "redirect:/vehicle/all";
    }

}
