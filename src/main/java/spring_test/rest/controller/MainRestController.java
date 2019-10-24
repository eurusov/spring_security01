package spring_test.rest.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import spring_test.model.User;
import spring_test.service.UserService;

import java.util.List;

@RestController
@RequestMapping("admin")
public class MainRestController {
    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @GetMapping(value = "/users", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String getUserList() throws JsonProcessingException {
        ObjectWriter ow = new ObjectMapper().writerFor(List.class).withDefaultPrettyPrinter();
        return ow.writeValueAsString(userService.getUserList());
    }

    @GetMapping(value = "users/{username}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String getUser(@PathVariable String username) throws JsonProcessingException {
        ObjectWriter ow = new ObjectMapper().writerFor(User.class).withDefaultPrettyPrinter();
        return ow.writeValueAsString(userService.getUserByUsername(username));
    }

    @DeleteMapping(value = "delete/{username}")
    public void deleteUser(@PathVariable String username) {
        userService.deleteUser(username);
    }
}
