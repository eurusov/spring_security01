package spring_test.model;

import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;

@Entity
@Table(name = "authorities")
public class Authorities implements GrantedAuthority {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "authority_id")
    private Long authorityId;

    @Column(name = "authority")
    private String authority;

    @ManyToOne
    @JoinColumn(name = "username")
    private User user;

    // Constructors
    public Authorities() {
    }

    public Authorities(User user) {
        this.user = user;
    }

    // Getters
    public Long getAuthorityId() {
        return authorityId;
    }

    @Override
    public String getAuthority() {
        return authority;
    }

    public User getUser() {
        return user;
    }

    // Setters
    public void setAuthorityId(Long authorityId) {
        this.authorityId = authorityId;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Authorities{" +
                "authorityId=" + authorityId +
                ", authority='" + authority + '\'' +
                ", username=" + user.getUsername() +  // User replaced to username, to avoid cyclic dependency and stack overflow.
                '}';
    }
}
