package com.ooad.demo.Service.Implementation;

import com.ooad.demo.Model.Users;
import com.ooad.demo.Repository.Interface.UserRepo;
import com.ooad.demo.Service.Interface.AllService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class AllServiceImpl implements AllService {

    private final UserRepo userRepo;

    @Autowired
    public AllServiceImpl(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    @Override
    @Transactional
    public void addUser(Users users) {
        userRepo.addUser(users);
    }
}
