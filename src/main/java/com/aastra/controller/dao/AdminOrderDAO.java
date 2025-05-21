package com.aastra.controller.dao;

import com.aastra.controller.database.DBConnect;
import com.aastra.model.Order;
import com.aastra.model.OrderItem;
import com.aastra.model.Product;

import java.sql.*;
import java.util.*;

public class AdminOrderDAO {

    public List<Order> getAllOrdersWithItems() throws SQLException, ClassNotFoundException {
        List<Order> orders = new ArrayList<>();
        String orderQuery = "SELECT * FROM orders ORDER BY order_id DESC";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement orderStmt = conn.prepareStatement(orderQuery);
             ResultSet orderRs = orderStmt.executeQuery()) {

            while (orderRs.next()) {
                Order order = new Order();
                order.setOrderId(orderRs.getInt("order_id"));
                order.setUserId(orderRs.getInt("user_id"));
                order.setTotalAmount(orderRs.getDouble("total_amount"));
                order.setStatus(orderRs.getString("status"));

                List<OrderItem> items = getOrderItemsByOrderId(order.getOrderId(), conn);
                order.setItems(items);

                orders.add(order);
            }
        }

        return orders;
    }

    private List<OrderItem> getOrderItemsByOrderId(int orderId, Connection conn) throws SQLException, ClassNotFoundException {
        List<OrderItem> items = new ArrayList<>();
        String itemQuery = "SELECT * FROM order_items WHERE order_id = ?";

        try (PreparedStatement itemStmt = conn.prepareStatement(itemQuery)) {
            itemStmt.setInt(1, orderId);
            ResultSet itemRs = itemStmt.executeQuery();

            ProductDAO productDAO = new ProductDAO();

            while (itemRs.next()) {
                OrderItem item = new OrderItem();
                item.setQuantity(itemRs.getInt("quantity"));
                item.setUnitPrice(itemRs.getDouble("unit_price"));

                Product product = productDAO.getProductById(itemRs.getInt("product_id"));
                item.setProduct(product);

                items.add(item);
            }
        }

        return items;
    }
}
