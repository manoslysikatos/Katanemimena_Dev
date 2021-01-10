package gr.hua.dit.ds.springmvcdemo1.dao;

import java.util.List;

import gr.hua.dit.ds.springmvcdemo1.entity.Task;

public interface TaskDAO {
	public List<Task> getAllTasks();
	public int getCount(int id);
	public Task getTaskInfo(String taskID);
}
