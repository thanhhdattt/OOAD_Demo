package com.ooad.demo.Repository.Implementation;

import com.ooad.demo.Model.Status.Role;
import com.ooad.demo.Model.Users;
import com.ooad.demo.Repository.Interface.UserRepo;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Repository
public class UserImpl implements UserRepo {
    @PersistenceContext
    private EntityManager em;

    @Override
    public void addUser(Users users) {
        Query query = this.em.createNativeQuery("INSERT INTO users " +
                "(username, password, role, first_name, last_name, phone, address, email, birthday, picture_url)" +
                "VALUES (?,?,?,?,?,?,?,?,?,?)");
        query.setParameter(1, users.getUsername());
        query.setParameter(2, users.getPassword());
        query.setParameter(3, Role.STUDENT.label);
        query.setParameter(4, "???");
        query.setParameter(5, "???");
        query.setParameter(6, "???");
        query.setParameter(7, "???");
        query.setParameter(8, users.getEmail());
        query.setParameter(9, "???");
        query.setParameter(10, "https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg");
        query.executeUpdate();
    }
}
