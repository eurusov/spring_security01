package spring_test.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import spring_test.model.User;

import java.util.List;

public interface UserService extends UserDetailsService {

    boolean addUser(User user);

    User getUserByUsername(String username);

    List<User> getUserList();

    boolean updateUser(User user);

    boolean deleteUser(String username);
}
