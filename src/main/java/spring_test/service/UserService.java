package spring_test.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import spring_test.model.User;

public interface UserService extends UserDetailsService {
    User getUserByUsername(String username);
}
