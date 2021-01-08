package gr.hua.dit.ds.springmvcdemo1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import gr.hua.dit.ds.springmvcdemo1.dao.UserDAO;
import gr.hua.dit.ds.springmvcdemo1.entity.User;

@Controller
@RequestMapping("/supervisors")
public class SupervisorController {
	
	@Autowired
    private UserDAO userDAO;
    
    @GetMapping("list")
    public String listStudents(Model model) {
    	
    	List<User> supervisors = userDAO.getUsers("ROLE_SUPER");
    	
    	model.addAttribute("supervisors", supervisors);
    	
    	return "supervisors";
    }

}
