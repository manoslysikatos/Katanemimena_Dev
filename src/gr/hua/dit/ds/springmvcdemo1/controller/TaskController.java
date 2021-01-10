package gr.hua.dit.ds.springmvcdemo1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.server.ResponseStatusException;

import gr.hua.dit.ds.springmvcdemo1.dao.TaskDAO;
import gr.hua.dit.ds.springmvcdemo1.entity.Task;


@Controller
@RequestMapping("/tasks")
public class TaskController {

	 @Autowired
	    private TaskDAO taskDAO;
	    
	 
	 	@PreAuthorize("hasRole('ROLE_ADMIN')")
	    @GetMapping("list")
	    public String listAll(Model model) {
	    	
	    	List<Task> tasks = taskDAO.getAllTasks();
	    	
	    	model.addAttribute("tasks", tasks);
	    	
	    	return "tasks";
	    }
	 	
	    /*
	    @GetMapping("/info")
	    @ResponseBody
	    public Task getTask(@RequestParam String id) {

	            User tmp = userDAO.getUserInfo(id);

	            if (tmp == null) {
	                    throw new ResponseStatusException(HttpStatus.NOT_FOUND, "customer not found");
	            }

	            return tmp;
	    }*/
}
