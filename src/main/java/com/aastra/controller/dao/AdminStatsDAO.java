package com.aastra.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.aastra.controller.database.DBConnect;

public class AdminStatsDAO {

    public int getTotalUsers() throws SQLException, ClassNotFoundException {
        return getCount("SELECT COUNT(*) FROM users");
    }

    public int getTotalOrders() throws SQLException, ClassNotFoundException {
        return getCount("SELECT COUNT(*) FROM orders");
    }

    public int getTotalProducts() throws SQLException, ClassNotFoundException {
        return getCount("SELECT COUNT(*) FROM products");
    }

    public double getTotalEarnings() throws SQLException, ClassNotFoundException {
        double earnings = 0;
        String sql = "SELECT SUM(total_amount) AS total FROM orders";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                earnings = rs.getDouble("total");
            }
        }
        return earnings;
    }

    private int getCount(String sql) throws SQLException, ClassNotFoundException {
        int count = 0;
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        }
        return count;
    }
}