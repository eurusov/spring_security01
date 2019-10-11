package spring_test.dao;

import spring_test.model.User;

import java.util.List;

public interface UserDao {

    void addUser(User user);

    User getUserByUsername(String username);

    List<User> getUserList();

    void updateUser(User user);

    void deleteUser(User user);
}
