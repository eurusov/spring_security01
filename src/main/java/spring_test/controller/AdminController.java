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
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public String showUserListForAdmin(Model model, Principal principal) {
        List<User> userList = userService.getUserList();
        model.addAttribute("userList", userList);
        User loggedUser = userService.getUserByUsername(principal.getName());
        model.addAttribute("principal", loggedUser);
        return "admin/admin";
    }

    @GetMapping("/new")
    public String showNewFromAdmin() {
//        model.addAttribute("user", new User());
        return "admin/new";
    }

    @PostMapping("/saveNewUser")
    public String saveNewUser(@ModelAttribute("user") User user) {
        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
        userService.addUser(user);
        return "redirect:/admin";
    }

    @GetMapping("/profile")
    public String index(Model model, Principal principal) {
        User loggedUser = userService.getUserByUsername(principal.getName());
        model.addAttribute("principal", loggedUser);
        return "admin/profile";
    }

    @GetMapping("/profile/edit")
    public ModelAndView editUserGet(ModelAndView modelAndView, Principal principal) {
        User user = userService.getUserByUsername(principal.getName());
        modelAndView.addObject("user", user);
        modelAndView.setViewName("admin/edit");
        return modelAndView;
    }

    @PostMapping("/edit")
    public String showEditPage(@RequestParam("editUsername") String editUsername, Model model) {
        User user = userService.getUserByUsername(editUsername);
        model.addAttribute("user", user);
        return "admin/edit";
    }

    @PostMapping("/update")
    public String updateEditedUser(@ModelAttribute("user") User user) {
        userService.updateUser(user);
        return "redirect:/admin";
    }

    @PostMapping("/delete")
    public String deleteUser(@ModelAttribute("deleteUser") String deleteUser) {
        userService.deleteUser(deleteUser);
        return "redirect:/admin";
    }
}
