package spring_test.model;

import javax.persistence.*;

@Entity
@Table(name = "authorities")
public class Authorities {

    @Id
    @Column(name = "authority")
    private String authority;

    @ManyToOne
    @JoinColumn(name = "username", nullable=false)
    private User user;

    public String getAuthority() {
        return authority;
    }
}
