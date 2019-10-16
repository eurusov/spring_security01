package spring_test.service;

import spring_test.model.User;

import java.util.List;

public interface UserService {

    boolean addUser(String username, String password, String firstName, String lastName, String email);

    User getUserByUsername(String username);

    List<User> getUserList();

    boolean updateUser(User user);

    boolean deleteUser(String username);

}
