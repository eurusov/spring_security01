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

@Service("userService")
public class UserServiceImpl implements UserService {

    private UserDao userDao;

    @Autowired
    private void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Transactional(readOnly = true)
    @Override
    public User getUserByUsername(String username) {
        return userDao.getUserByUsername(username);
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
