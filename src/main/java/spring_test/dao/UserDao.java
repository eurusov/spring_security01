package spring_test.dao;

import spring_test.model.User;

public interface UserDao {
    User getUserByUsername(String username);
}
