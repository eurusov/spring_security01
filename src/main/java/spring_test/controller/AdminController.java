package spring_test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import spring_test.model.User;
import spring_test.service.UserService;

import java.util.List;

@Controller
public class AdminController {
    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String showUserListForAdmin(Model model) {
        List<User> userList = userService.getUserList();
        model.addAttribute("userList", userList);
        return "user-list";
    }

    @PostMapping("/delete")
    public String deleteUser(@ModelAttribute("deleteUser") String deleteUser) {
        userService.deleteUser(deleteUser);
        return "redirect:/admin";
    }
}
