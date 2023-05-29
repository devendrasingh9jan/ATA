package com.travel.ata.service;

import com.travel.ata.model.User;
import com.travel.ata.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;


@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;


    public void saveUser(User user) {
        if (isUserExists(user.getUsername())) {
            throw new IllegalArgumentException("Username already exists");
        }
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);
        user.setAuthority("ROLE_USER");
        userRepository.save(user);
    }

    public boolean isUserExists(String username) {
        User existingUser = userRepository.findByUsername(username);
        return existingUser != null;
    }

    public void updateUser(User user) {
        User existingUser = userRepository.findByUsername(user.getUsername());
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        existingUser.setPassword(encodedPassword);
        userRepository.save(existingUser);
    }
}
