package com.data.repository;

import com.data.connection.ConnectionDB;
import com.data.model.User;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

@Repository
public class UserRepositoryImp implements UserRepository {
    @Override
    public boolean create(User user) {
        Connection conn = null;
        CallableStatement cs = null;
        try {
            conn = ConnectionDB.openConnection();
            cs = conn.prepareCall("{call create_user(?, ?, ?)}");
            cs.setString(1, user.getUsername());
            cs.setString(2, user.getPassword());
            cs.setString(3, user.getEmail());
            cs.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            ConnectionDB.closeConnection(conn, cs);
        }
        return false;
    }
}
