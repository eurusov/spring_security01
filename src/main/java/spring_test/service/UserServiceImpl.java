package spring_test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import spring_test.dao.UserDao;
import spring_test.model.Authorities;
import spring_test.model.User;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    private UserDao userDao;

    @Autowired
    private void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Transactional
    @Override
    public boolean addUser(User user) {
        User existing = userDao.getUserByUsername(user.getUsername());
        if (existing != null) {
            return false;
        }
        userDao.addUser(user);
        return true;
    }

    @Transactional(readOnly = true)
    @Override
    public User getUserByUsername(String username) {
        return userDao.getUserByUsername(username);
    }

    @Transactional(readOnly = true)
    @Override
    public List<User> getUserList() {
        return userDao.getUserList();
    }

    @Transactional
    @Override
    public boolean updateUser(User user) {
        User existing = userDao.getUserByUsername(user.getUsername());
        if (existing == null) {
            return false;
        }
        userDao.updateUser(user);
        return true;
    }

    @Transactional
    @Override
    public boolean deleteUser(String username) {
        User existing = userDao.getUserByUsername(username);
        if (existing == null) {
            return false;
        }
        userDao.deleteUser(existing);
        return true;
    }

    @Transactional
    @Override
    public void addUserAuthority(User user, String authority) {
        userDao.addUserAuthority(user, authority);
    }

    @Transactional(readOnly = true)
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDao.getUserByUsername(username);
        UserBuilder builder;
        if (user != null) {
            builder = org.springframework.security.core.userdetails.User.withUsername(username);
            builder.disabled(!user.isEnabled());
            builder.password(user.getPassword());

            String[] authorities = user.getAuthorities()
                    .stream().map(Authorities::getAuthority).toArray(String[]::new);

            builder.authorities(authorities);
        } else {
            throw new UsernameNotFoundException("User not found: " + username);
        }
        return builder.build();
    }
}
