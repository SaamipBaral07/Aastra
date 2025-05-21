package com.aastra.controller.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
	public ArrayList<String[]> getRecentOrders(int limit) throws ClassNotFoundException {
	    ArrayList<String[]> orders = new ArrayList<>();
	    String query = "SELECT o.user_id, p.name, oi.quantity, (oi.quantity * oi.unit_price) AS amount " +
	                   "FROM orders o " +
	                   "JOIN order_items oi ON o.order_id = oi.order_id " +
	                   "JOIN products p ON oi.product_id = p.product_id " +
	                   "ORDER BY o.order_date DESC LIMIT ?";

	    try (Connection conn = DBConnect.getConnection();
	    		PreparedStatement ps = conn.prepareStatement(query)) {
	        ps.setInt(1, limit);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            String[] order = {
	                String.valueOf(rs.getInt("user_id")),
	                rs.getString("name"),
	                String.valueOf(rs.getInt("quantity")),
	                String.format("%.2f", rs.getDouble("amount"))
	            };
	            orders.add(order);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return orders;
	}


}
