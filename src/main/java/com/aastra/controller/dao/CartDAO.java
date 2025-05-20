package com.aastra.controller.dao;

import com.aastra.controller.database.DBConnect;
import com.aastra.model.CartItem;
import com.aastra.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

	public void addToCart(int userId, int productId, int quantity) throws ClassNotFoundException {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        conn = DBConnect.getConnection();

	        // Check if product already exists in user's cart
	        String checkSql = "SELECT quantity FROM cart WHERE user_id = ? AND product_id = ?";
	        pstmt = conn.prepareStatement(checkSql);
	        pstmt.setInt(1, userId);
	        pstmt.setInt(2, productId);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            // Product already in cart -> update quantity
	            int existingQuantity = rs.getInt("quantity");
	            int newQuantity = existingQuantity + quantity;

	            String updateSql = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
	            pstmt = conn.prepareStatement(updateSql);
	            pstmt.setInt(1, newQuantity);
	            pstmt.setInt(2, userId);
	            pstmt.setInt(3, productId);
	            pstmt.executeUpdate();
	        } else {
	            // Product not in cart -> insert new row
	            String insertSql = "INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?)";
	            pstmt = conn.prepareStatement(insertSql);
	            pstmt.setInt(1, userId);
	            pstmt.setInt(2, productId);
	            pstmt.setInt(3, quantity);
	            pstmt.executeUpdate();
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBConnect.close(rs, pstmt, conn);
	    }
	}

    public List<CartItem> getCartItemsByUserId(int userId) throws ClassNotFoundException, SQLException {
        List<CartItem> cartItems = new ArrayList<>();
        Connection conn = DBConnect.getConnection(); // Your DB connection

        String sql = "SELECT product_id, quantity FROM cart WHERE user_id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, userId);
        ResultSet rs = stmt.executeQuery();

        ProductDAO productDAO = new ProductDAO();

        while (rs.next()) {
            int productId = rs.getInt("product_id");
            int quantity = rs.getInt("quantity");

            Product product = productDAO.getProductById(productId);
            CartItem item = new CartItem(product, quantity);
            item.setProduct(product);
            item.setQuantity(quantity);

            cartItems.add(item);
        }

        rs.close();
        stmt.close();
        conn.close();

        return cartItems;
    }
    public void updateCartItem(int userId, int productId, int quantity) {
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement("UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?")) {
            stmt.setInt(1, quantity);
            stmt.setInt(2, userId);
            stmt.setInt(3, productId);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void removeCartItem(int userId, int productId) {
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM cart WHERE user_id = ? AND product_id = ?")) {
            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void clearCart(Integer userId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM cart WHERE user_id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            pstmt.executeUpdate();
        }
    }
    public int getProductStock(int productId) {
        int stock = 0;
        String sql = "SELECT stock FROM products WHERE product_id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                stock = rs.getInt("stock");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stock;
    }
    public int getCartItemQuantity(int userId, int productId) {
        String sql = "SELECT quantity FROM cart WHERE user_id = ? AND product_id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("quantity");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

// You can add other methods like getCartItems(userId), removeFromCart(), etc.
}
