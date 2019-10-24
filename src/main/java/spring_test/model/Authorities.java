package spring_test.model;

import lombok.*;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;

@Entity
@Table(name = "authorities")
@ToString
@Getter
@Setter
@NoArgsConstructor
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
    public Authorities(User user) {
        this.user = user;
    }
}
