package spring_test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import spring_test.model.User;
import spring_test.service.UserService;

import java.security.Principal;
import java.util.List;

@Controller
public class MyController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public String index(Model model, Principal principal) {
        User loggedUser = userService.getUserByUsername(principal.getName());
        model.addAttribute("principal", loggedUser);
        model.addAttribute("message", "You are logged in as " + principal.getName());
        return "index";
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<User> userList = userService.getUserList();
        model.addAttribute("listUser", userList);
        return "user-list";
    }
}
