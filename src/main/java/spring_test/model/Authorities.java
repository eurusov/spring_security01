package spring_test.model;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;

@Entity
@Table(name = "authorities")
@ToString
@Getter
@Setter
public class Authorities implements GrantedAuthority {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "authority_id")
    @Setter(AccessLevel.NONE)
    private Long authorityId;

    @Column(name = "authority")
    private String authority;

    @ManyToOne
    @JoinColumn(name = "username")
    @ToString.Exclude
    private User user;

    // Constructor
    public Authorities() {
    }

    // Constructor
    public Authorities(User user) {
        this.user = user;
    }
}
