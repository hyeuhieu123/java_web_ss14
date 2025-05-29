package com.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @GetMapping("login")
    public String login() {
        return "login";
    }

    @PostMapping("login")
    public String login(@RequestParam String username, @RequestParam String password, HttpSession session, Model model) {
        if (username.equals("abc") && password.equals("123")) {
            session.setAttribute("username", username);
        } else {
            model.addAttribute("message", "Tài khoản hoặc mật khẩu không chính xác");
            return "login";
        }
        return "welcome";
    }
}
