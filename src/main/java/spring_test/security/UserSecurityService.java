package spring_test.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import spring_test.dao.UserRepository;
import spring_test.model.User;

@Component
public class UserSecurityService implements UserDetailsService {

    private UserRepository userRepository;

    @Autowired
    public void setUserRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Transactional(readOnly = true)
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.getOne(username);

        //noinspection ResultOfMethodCallIgnored
        user.getAuthorities().size();  // (!!!) This is to avoid LazyInitializationException when getting detached user outside of service layer.
        return user;
    }
}
