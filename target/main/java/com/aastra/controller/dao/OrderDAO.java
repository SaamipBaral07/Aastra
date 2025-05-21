package com.aastra.controller.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.aastra.controller.database.DBConnect;
import com.aastra.model.CartItem;

public class OrderDAO {
	public int createOrder(int userId, double total) throws SQLException, ClassNotFoundException {
	    String sql = "INSERT INTO orders (user_id, total_amount, status) VALUES (?, ?, 'Pending')";
	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
	        stmt.setInt(1, userId);
	        stmt.setDouble(2, total);
	        stmt.executeUpdate();

	        try (ResultSet rs = stmt.getGeneratedKeys()) {
	            if (rs.next()) {
	                return rs.getInt(1); // Return order_id
	            }
	        }
	    }
	    return -1;
	}

	public void addOrderItem(int orderId, CartItem item) throws SQLException, ClassNotFoundException {
	    String sql = "INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES (?, ?, ?, ?)";
	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setInt(1, orderId);
	        stmt.setInt(2, item.getProduct().getProductId());
	        stmt.setInt(3, item.getQuantity());
	        stmt.setDouble(4, item.getProduct().getPrice());
	        stmt.executeUpdate();
	    }
	}

	public void updateProductStock(int productId, int quantity) throws SQLException, ClassNotFoundException {
	    String sql = "UPDATE products SET stock = stock - ? WHERE product_id = ?";
	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setInt(1, quantity);
	        stmt.setInt(2, productId);
	        stmt.executeUpdate();
	    }
	}


}
