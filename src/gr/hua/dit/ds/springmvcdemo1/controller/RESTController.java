package gr.hua.dit.ds.springmvcdemo1.controller;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gr.hua.dit.ds.springmvcdemo1.entity.Candidate;
import gr.hua.dit.ds.springmvcdemo1.entity.User;

@RestController
@RequestMapping("/api")
public class RESTController {
	@PostMapping("/users")
    public String sayHello(@RequestBody String postParameters) {
		System.out.println(postParameters);
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml")
                .addAnnotatedClass(User.class)
                .addAnnotatedClass(Candidate.class)
                .buildSessionFactory();
		JSONObject parameters = new JSONObject(postParameters);
		
		
// create session
		
Session session = factory.getCurrentSession();
User user =  new User();
try {
        // create the objects
	switch(parameters.getString("role")) {
	  case "student":
		  user = new User(parameters.getString("firstName"),parameters.getString("lastName"),parameters.getString("email"),parameters.getString("phone"), 1, 1, "ROLE_CAN");
	      Candidate candidate = new Candidate(5,12);
	      user.setCandidate(candidate);
	    break;
	  case "professor":
		  user = new User(parameters.getString("firstName"),parameters.getString("lastName"),parameters.getString("email"),parameters.getString("phone"), 1, 1, "ROLE_SUPER");
	    break;
	  case "staff":
		  user = new User(parameters.getString("firstName"),parameters.getString("lastName"),parameters.getString("email"),parameters.getString("phone"), 1, 1, "ROLE_ADMIN");
	    break;
	  case "board":
		  user = new User(parameters.getString("firstName"),parameters.getString("lastName"),parameters.getString("email"),parameters.getString("phone"), 1, 1, "ROLE_BOARD");
	    break;
	  
	}
/*
        User user = new User("Nikos","Papadopoulos","it@hua.gr", "3456897", 1, 1, "ROLE_CAN");
        Candidate candidate = new Candidate(5,12);
        
        // associate the objects
        user.setCandidate(candidate);
      
       */
        // start a transaction
        session.beginTransaction();
        
        // save the teacher
        // NOTE: this will also save teacherProfile because of Cascade
        session.save(user);
        
        // commit transaction
        session.getTransaction().commit();
        JSONObject json = new JSONObject();
        json.put("status","success");
        return json.toString();

      

}catch(HibernateException r){
    String error = r.getMessage();
    JSONObject json = new JSONObject();
    json.put("status","fail");
    json.put("error",error);
    return json.toString();
} finally {
        factory.close();
        
}
        
    }

}
