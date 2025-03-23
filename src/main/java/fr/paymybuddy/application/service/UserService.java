package fr.paymybuddy.application.service;

import fr.paymybuddy.application.model.User;
import fr.paymybuddy.application.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public void registerUser(String username, String password, String email) {
        if (userRepository.findByEmail(email).isPresent()) {
            throw new IllegalArgumentException("Cet email est déjà pris.");
        }
        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(passwordEncoder.encode(password)); // Hachage du mot de passe
        userRepository.save(user);
    }

}