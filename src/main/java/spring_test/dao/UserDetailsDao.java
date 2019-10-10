package spring_test.dao;

import spring_test.model.User;

public interface UserDetailsDao {
    User findUserByUsername(String username);
}
