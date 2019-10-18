package spring_test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import spring_test.model.User;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, String> {

    @Query("select u from User u join fetch u.authorities a")
    List<User> getUserList();

    @Query("select u from User u join fetch u.authorities a where u.username = :username")
    User getOneWithAuthorities(@Param("username") String username);

}
