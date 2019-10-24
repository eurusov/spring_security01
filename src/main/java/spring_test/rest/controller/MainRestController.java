package spring_test.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import spring_test.model.User;
import spring_test.service.UserService;

@RestController
@RequestMapping("admin")
public class MainRestController {
    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @GetMapping(value = "/{username}", produces = "application/json")
    public User getUser(@PathVariable String username) {
        return userService.getUserByUsername(username);
    }
}
