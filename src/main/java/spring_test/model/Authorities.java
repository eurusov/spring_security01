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

    public Authorities() {
    }

    public Authorities(User user) {
        this.user = user;
    }

    public String getAuthority() {
        return authority;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    @Override
    public String toString() {
        return "Authorities{" +
                "authorityId=" + authorityId +
                ", authority='" + authority + '\'' +
                ", user=" + user +
                '}';
    }
}
