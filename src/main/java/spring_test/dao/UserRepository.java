package spring_test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import spring_test.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
}
