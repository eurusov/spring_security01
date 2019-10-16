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
    public boolean addUser(String username, String password, String firstName, String lastName, String email) {
        if (userRepository.existsById(username)) {
            return false;
        }
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setEnabled(true);
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
        User user = userRepository.getOne(username);
        //noinspection ResultOfMethodCallIgnored
        user.getAuthorities().size();  // (!!!) This is to avoid LazyInitializationException when getting detached user outside of service layer.
        return user;
    }

    @Transactional(readOnly = true)
    @Override
    public List<User> getUserList() {
        List<User> userList = userRepository.findAll();
        //noinspection ResultOfMethodCallIgnored
        userList.forEach((u) -> u.getAuthorities().size());  // (!!!) This is to avoid LazyInitializationException when getting detached user outside of service layer.
        return userList;
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
