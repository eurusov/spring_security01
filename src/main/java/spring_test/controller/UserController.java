package spring_test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import spring_test.model.User;
import spring_test.service.UserService;

import java.security.Principal;

@Controller
@RequestMapping("/")
public class UserController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("")
    public String userHome(Model model, Principal principal) {
        User loggedUser = userService.getUserByUsername(principal.getName());
        model.addAttribute("principal", loggedUser);
        return "user/user";
    }

    @GetMapping("/new")
    public String showNewUserForm(Model model) {
        model.addAttribute("user", new User());
        return "new";
    }

    @PostMapping("/saveNewUser")
    public String saveNewUser(@ModelAttribute("user") User user) {
        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
        userService.addUser(user);
        return "redirect:/";
    }

    @GetMapping("/edit")
    public ModelAndView editUserGet(ModelAndView modelAndView, Principal principal) {
        User user = userService.getUserByUsername(principal.getName());
        modelAndView.addObject("user", user);
        modelAndView.setViewName("user/edit");
        return modelAndView;
    }

    @PostMapping("/update")
    public String updateEditedUser(@ModelAttribute("user") User user) {
        userService.updateUser(user);
        return "redirect:/";
    }
}
