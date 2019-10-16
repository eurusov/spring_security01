package spring_test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import spring_test.model.User;
import spring_test.service.UserService;

import java.security.Principal;

@Controller
public class UserController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public String index(Model model, Principal principal) {
        User loggedUser = userService.getUserByUsername(principal.getName());
        model.addAttribute("principal", loggedUser);
        return "index";
    }

    @GetMapping("/new")
    public String showNewUserForm(Model model, Principal principal) {
        if (principal != null) {
            User principalUser = userService.getUserByUsername(principal.getName());
            model.addAttribute("principal", principalUser);
        }
        User user = new User();
        model.addAttribute("user", user);
        return "new";
    }

    @PostMapping("/saveNewUser")
    public String saveNewUser(@ModelAttribute("user") User user) {
        String password = new BCryptPasswordEncoder().encode(user.getPassword());
        userService.addUser(user.getUsername(), password, user.getFirstName(), user.getLastName(), user.getEmail());
        return "redirect:/";
    }

    @GetMapping("/edit")
    public ModelAndView editUserGet(ModelAndView modelAndView, Principal principal) {
        User user = userService.getUserByUsername(principal.getName());
        modelAndView.addObject("user", user);
        modelAndView.addObject("principal", user);
        modelAndView.setViewName("edit");
        return modelAndView;
    }

    @PostMapping("/update")
    public String updateEditedUser(@ModelAttribute("user") User user) {
        userService.updateUser(user);
        return "redirect:/";
    }

    @PostMapping("/edit")
    public String showEditPage(@RequestParam("editUsername") String editUsername, Model model, Principal principal) {
        if (principal != null) {
            User principalUser = userService.getUserByUsername(principal.getName());
            model.addAttribute("principal", principalUser);
        }
        User user = userService.getUserByUsername(editUsername);
        if (user == null) {
            return "redirect:/";
        }
        model.addAttribute("user", user);
        return "edit";
    }
}
