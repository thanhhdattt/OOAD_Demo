package com.ooad.demo.Controller;

import com.ooad.demo.Model.Users;
import com.ooad.demo.Service.Interface.AllService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BaseController {
    private final AllService service;

    @Autowired
    public BaseController(AllService service) {
        this.service = service;
    }

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String welcomePage(Model model) {
        Users user = new Users();
        model.addAttribute("user", user);
        return "welcome";
    }
    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") Users user){
        service.addUser(user);
        return "redirect:home";
    }
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(){
        return "landing_page";
    }
}
