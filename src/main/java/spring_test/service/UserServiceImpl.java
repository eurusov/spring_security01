package spring_test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import spring_test.dao.UserRepository;
import spring_test.model.Authorities;
import spring_test.model.User;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    private UserRepository userRepository;

    @Autowired
    public void setUserRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Transactional
    @Override
    public boolean addUser(User user) {
        if (userRepository.existsById(user.getUsername())) {
            return false;
        }
        Authorities authority = new Authorities(user);
        authority.setAuthority("ROLE_USER");
        user.getAuthorities().add(authority);
        userRepository.save(user);
        return true;
    }

    @Transactional(readOnly = true)
    @Override
    public User getUserByUsername(String username) {
        if (!userRepository.existsById(username)) {
            return null;
        }
        return userRepository.getOneWithAuthorities(username);
    }

    @Transactional(readOnly = true)
    @Override
    public List<User> getUserList() {
        return userRepository.getUserList();
    }

    @Transactional
    @Override
    public boolean updateUser(User user) {
        String username = user.getUsername();
        if (!userRepository.existsById(username)) {
            return false;
        }
        User persistent = userRepository.getOne(username);
        persistent.setEmail(user.getEmail());
        persistent.setFirstName(user.getFirstName());
        persistent.setLastName(user.getLastName());
        return true;
    }

    @Transactional
    @Override
    public boolean deleteUser(String username) {
        if (!userRepository.existsById(username)) {
            return false;
        }
        userRepository.deleteById(username);
        return true;
    }

//    @Transactional(readOnly = true)
//    @Override
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        User user = userDao.getUserByUsername(username);
//        UserBuilder builder;
//        if (user != null) {
//            builder = org.springframework.security.core.userdetails.User.withUsername(username);
//            builder.disabled(!user.isEnabled());
//            builder.password(user.getPassword());
//
//            String[] authorities = user.getAuthorities()
//                    .stream().map(Authorities::getAuthority).toArray(String[]::new);
//
//            builder.authorities(authorities);
//        } else {
//            throw new UsernameNotFoundException("User not found: " + username);
//        }
//        return builder.build();
//    }
}
