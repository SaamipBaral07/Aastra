package com.aastra.controller.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.aastra.controller.database.DBConnect;
import com.aastra.model.User;
import com.aastra.util.EncryptDecrypt;


public class UserDAO {
	private Connection conn;
	private PreparedStatement ps;
	// Constructor: Initializes the database connection when an object is created
	public UserDAO() throws ClassNotFoundException, SQLException {
		this.conn = DBConnect.getConnection();
	}
	// Registers a new user in the database
	public boolean register(User user) {
	    boolean isUserRegistered = false;

	    if (conn != null) {
	        try {
	            // Step 1: Check if email already exists
	            String checkQuery = "SELECT email FROM users WHERE email = ?";
	            ps = conn.prepareStatement(checkQuery);
	            ps.setString(1, user.getEmail());
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                // Email already exists in the database
	                return false;
	            }

	            // Step 2: If email is unique, insert the user
	            String insertQuery = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)";
	            ps = conn.prepareStatement(insertQuery);
	            ps.setString(1, user.getUserName());
	            ps.setString(2, user.getEmail());
	            ps.setString(3, user.getPassword()); // Note: Hash in real world
	            ps.setString(4, user.getRole());

	            if (ps.executeUpdate() > 0) {
	                isUserRegistered = true;
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return isUserRegistered;
	}

	// get all the users from database
	public ArrayList<User> getAllUsers() {
		ArrayList<User> users = new ArrayList<>();
		String query = "SELECT * FROM users";
		if (conn != null) {
			try {
				ps = conn.prepareStatement(query);
				ResultSet userSet = ps.executeQuery(); //stores all the user information retrieved by running query in database
				
				// Iterate over result set and populate User objects
				while (userSet.next()) {
					User user = new User();
					user.setUserId(userSet.getInt("user_id"));
					user.setUserName(userSet.getString("username"));
					user.setEmail(userSet.getString("email"));
					user.setPassword(userSet.getString("password"));					
					user.setRole(userSet.getString("role"));
					user.setCreatedAt(userSet.getTimestamp("created_at"));
					users.add(user);
				}
			} catch (SQLException e) {
				// TODO Shows error if query fails
				e.printStackTrace();
			}
		}
		return users;
	}
	// Authenticates user by checking email and password
	public User login(String emailToCheck, String passwordToCheck) {
	    User user = null;
	    try (Connection conn = DBConnect.getConnection()) {
	        // 1. Try encrypted login
	        String encryptedPassword = EncryptDecrypt.encrypt(passwordToCheck);
	        PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?");
	        ps.setString(1, emailToCheck);
	        ps.setString(2, encryptedPassword);
	        ResultSet rs = ps.executeQuery();

	        if (!rs.next()) {
	            // 2. Fallback to plaintext (legacy password)
	            ps = conn.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?");
	            ps.setString(1, emailToCheck);
	            ps.setString(2, passwordToCheck);
	            rs = ps.executeQuery();

	            if (rs.next()) {
	                // Login successful with plaintext -> upgrade password
	                String encrypted = EncryptDecrypt.encrypt(passwordToCheck);
	                PreparedStatement updatePs = conn.prepareStatement("UPDATE users SET password = ? WHERE email = ?");
	                updatePs.setString(1, encrypted);
	                updatePs.setString(2, emailToCheck);
	                updatePs.executeUpdate();
	            } else {
	                return null; // Login failed
	            }
	        }

	        // Build the user object (whether logged in via encrypted or plaintext)
	        user = new User();
	        user.setUserId(rs.getInt("user_id"));
	        user.setUserName(rs.getString("username"));
	        user.setEmail(rs.getString("email"));
	        user.setRole(rs.getString("role"));
	        user.setCreatedAt(rs.getTimestamp("created_at"));
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return user;
	}

	// Updates the username of a user by userId
	public boolean updateUsername(int userId, String newUsername) {
	    boolean isUpdated = false;
	    String query = "UPDATE users SET username = ? WHERE user_id = ?";

	    try {
	        ps = conn.prepareStatement(query);
	        ps.setString(1, newUsername);
	        ps.setInt(2, userId);

	        int rowsAffected = ps.executeUpdate();
	        if (rowsAffected > 0) {
	            isUpdated = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return isUpdated;
	}
	public ArrayList<User> getAllCustomers() {
	    ArrayList<User> customers = new ArrayList<>();
	    String query = "SELECT * FROM users WHERE role = 'CUSTOMER'";

	    if (conn != null) {
	        try {
	            ps = conn.prepareStatement(query);
	            ResultSet userSet = ps.executeQuery();

	            while (userSet.next()) {
	                User user = new User();
	                user.setUserId(userSet.getInt("user_id"));
	                user.setUserName(userSet.getString("username"));
	                user.setEmail(userSet.getString("email"));
	                user.setPassword(userSet.getString("password"));
	                user.setRole(userSet.getString("role"));
	                user.setCreatedAt(userSet.getTimestamp("created_at"));
	                customers.add(user);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return customers;
	}


}
