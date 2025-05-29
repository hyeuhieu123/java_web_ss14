package com.data.service;

import com.data.model.User;
import com.data.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImp implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public boolean create(User user) {
        return userRepository.create(user);
    }
}
