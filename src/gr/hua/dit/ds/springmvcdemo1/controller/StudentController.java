package gr.hua.dit.ds.springmvcdemo1.controller;

import gr.hua.dit.ds.springmvcdemo1.dao.UserDAO;
import gr.hua.dit.ds.springmvcdemo1.dao.StudentDAO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import gr.hua.dit.ds.springmvcdemo1.entity.User;


@Controller
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private UserDAO userDAO;
    
    @GetMapping("list")
    public String listStudents(Model model) {
    	
    	List<User> students = userDAO.getUsers("ROLE_CAN");
    	
    	model.addAttribute("students", students);
    	
    	return "students";
    }
    
    /* 
    @GetMapping("/add")
    public String addStudent() {
        return "student-form";

    }*/
	
}