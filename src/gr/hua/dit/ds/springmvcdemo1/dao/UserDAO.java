package gr.hua.dit.ds.springmvcdemo1.dao;

import java.util.List;

import gr.hua.dit.ds.springmvcdemo1.entity.User;

public interface UserDAO {
	public List<User> getUsers(String role);
	public int getCount(String role);
}

