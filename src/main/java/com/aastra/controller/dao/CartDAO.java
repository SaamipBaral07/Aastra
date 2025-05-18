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
        String sql = "INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE quantity = quantity + ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            stmt.setInt(3, quantity);
            stmt.setInt(4, quantity); // for ON DUPLICATE KEY

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
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
// You can add other methods like getCartItems(userId), removeFromCart(), etc.
}
