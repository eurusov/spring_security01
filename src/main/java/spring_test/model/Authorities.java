package spring_test.model;

import javax.persistence.*;

@Entity
@Table(name = "authorities")
public class Authorities {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "authority_id")
    private Integer authorityId;

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
    public Integer getAuthorityId() {
        return authorityId;
    }

    public String getAuthority() {
        return authority;
    }

    public User getUser() {
        return user;
    }

    // Setters
    public void setAuthorityId(Integer authorityId) {
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
