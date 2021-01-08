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
@RequestMapping("/board-members")
public class BoardMembersController {
	@Autowired
    private UserDAO userDAO;
    
    @GetMapping("list")
    public String listStudents(Model model) {
    	
    	List<User> board = userDAO.getUsers("ROLE_BOARD");
    	
    	model.addAttribute("board", board);
    	
    	return "board";
    }
}
