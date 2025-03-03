package fr.paymybuddy.application.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
@Entity
@Table(name = "users")
@Getter
@Setter
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(nullable = false)
    private Long id;

    //int id;
    private String username;
    private  String password;
    private  String email;
    @OneToMany
    private  List<User> connections;

}
