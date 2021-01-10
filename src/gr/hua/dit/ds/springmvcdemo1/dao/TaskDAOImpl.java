package gr.hua.dit.ds.springmvcdemo1.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gr.hua.dit.ds.springmvcdemo1.entity.Task;
import gr.hua.dit.ds.springmvcdemo1.entity.User;


@Repository
public class TaskDAOImpl implements TaskDAO {
	
	@Autowired
    private SessionFactory sessionFactory;

	@Override
	@Transactional
    public List<Task> getAllTasks() { 
        // get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        // create a query
        //Query<User> query = currentSession.createQuery("from User tmp where tmp.id='"+id+"'", User.class);
        //User tmp = query.getSingleResult();
        Query<Task> query2 = null;
      
        	query2 = currentSession.createQuery("from Task", Task.class);
      
        
		// execute the query and get the results list
        List<Task> tasks = query2.getResultList();

        //return the results
        return tasks;
    }
	
	@Override
	@Transactional
	 public int getCount(int id) { 
	    	//status = 0? Task Waiting For Approval By a Board Member
			//status = 1? Task Approved
	    	// get current hibernate session
	        Session currentSession = sessionFactory.getCurrentSession();

	        // create a query
	        Query<Task> query = currentSession.createQuery("from Task", Task.class);


	        // execute the query and get the results list
	        List<Task> result = query.getResultList();

	        //return the results
	        return result.size();
	    }
	
	@Override
    @Transactional
    public Task getTaskInfo(String taskID) { 
    	
    	// get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        // create a query
        Query<Task> query = currentSession.createQuery("from Task tmp where tmp.id='"+taskID+"'", Task.class);


        // execute the query and get the results list
        Task result = query.getSingleResult();

        //return the results
        return result;
    }
}
