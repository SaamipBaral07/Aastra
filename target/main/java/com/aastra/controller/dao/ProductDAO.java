package com.aastra.controller.dao;


import com.aastra.model.Product;
import com.aastra.controller.database.DBConnect;

import java.sql.*;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDAO {
	public List<Product> getAllProductsWithImages() {
	    Map<Integer, Product> productMap = new HashMap<>();
	    String query = "SELECT p.product_id, p.name, p.description, p.price, p.stock, p.category_id, pi.image_url " +
	                   "FROM products p " +
	                   "LEFT JOIN product_images pi ON p.product_id = pi.product_id";

	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            int productId = rs.getInt("product_id");

	            // If product not already in the map, add it
	            if (!productMap.containsKey(productId)) {
	                Product p = new Product();
	                p.setProductId(productId);
	                p.setName(rs.getString("name"));
	                p.setDescription(rs.getString("description"));
	                p.setPrice(rs.getDouble("price"));
	                p.setStock(rs.getInt("stock"));
	                p.setCategoryId(rs.getInt("category_id"));
	                p.setImageUrl(rs.getString("image_url")); // First image (if exists)
	                productMap.put(productId, p);
	            }
	            // else: skip other images for same product_id
	        }

	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	    }

	    return new ArrayList<>(productMap.values());
	}

    public Product getProductById(int productId) {
        String query = "SELECT p.product_id, p.name, p.description, p.price, p.stock, p.category_id, pi.image_url " +
                       "FROM products p LEFT JOIN product_images pi ON p.product_id = pi.product_id " +
                       "WHERE p.product_id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Product p = new Product();
                    p.setProductId(rs.getInt("product_id"));
                    p.setName(rs.getString("name"));
                    p.setDescription(rs.getString("description"));
                    p.setPrice(rs.getDouble("price"));
                    p.setStock(rs.getInt("stock"));
                    p.setCategoryId(rs.getInt("category_id"));
                    p.setImageUrl(rs.getString("image_url"));
                    return p;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void deleteProductById(int productId) {
        try (Connection conn = DBConnect.getConnection()) {
            // Delete image first if exists
            String deleteImage = "DELETE FROM product_images WHERE product_id = ?";
            try (PreparedStatement ps1 = conn.prepareStatement(deleteImage)) {
                ps1.setInt(1, productId);
                ps1.executeUpdate();
            }

            // Then delete product
            String deleteProduct = "DELETE FROM products WHERE product_id = ?";
            try (PreparedStatement ps2 = conn.prepareStatement(deleteProduct)) {
                ps2.setInt(1, productId);
                ps2.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void updateProduct(Product p) {
        try (Connection conn = DBConnect.getConnection()) {
            // Update product info
            String updateProduct = "UPDATE products SET name = ?, description = ?, price = ?, stock = ?, category_id = ? WHERE product_id = ?";
            try (PreparedStatement ps = conn.prepareStatement(updateProduct)) {
                ps.setString(1, p.getName());
                ps.setString(2, p.getDescription());
                ps.setDouble(3, p.getPrice());
                ps.setInt(4, p.getStock());
                ps.setInt(5, p.getCategoryId());
                ps.setInt(6, p.getProductId());
                ps.executeUpdate();
            }

            // Check if image already exists
            String checkImage = "SELECT COUNT(*) FROM product_images WHERE product_id = ?";
            try (PreparedStatement checkPs = conn.prepareStatement(checkImage)) {
                checkPs.setInt(1, p.getProductId());
                ResultSet rs = checkPs.executeQuery();
                rs.next();
                boolean exists = rs.getInt(1) > 0;

                if (exists) {
                    // Update image URL
                    String updateImage = "UPDATE product_images SET image_url = ? WHERE product_id = ?";
                    try (PreparedStatement ps = conn.prepareStatement(updateImage)) {
                        ps.setString(1, p.getImageUrl());
                        ps.setInt(2, p.getProductId());
                        ps.executeUpdate();
                    }
                } else {
                    // Insert new image row
                    String insertImage = "INSERT INTO product_images (product_id, image_url) VALUES (?, ?)";
                    try (PreparedStatement ps = conn.prepareStatement(insertImage)) {
                        ps.setInt(1, p.getProductId());
                        ps.setString(2, p.getImageUrl());
                        ps.executeUpdate();
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public boolean addProduct(Product p) {
        String insertProduct = "INSERT INTO products (name, description, price, stock, category_id) VALUES (?, ?, ?, ?, ?)";
        String insertImage = "INSERT INTO product_images (product_id, image_url) VALUES (?, ?)";

        try (Connection conn = DBConnect.getConnection()) {
            conn.setAutoCommit(false); // Start transaction

            // Insert product
            try (PreparedStatement ps = conn.prepareStatement(insertProduct, Statement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, p.getName());
                ps.setString(2, p.getDescription());
                ps.setDouble(3, p.getPrice());
                ps.setInt(4, p.getStock());
                if (p.getCategoryId() > 0) {
                    ps.setInt(5, p.getCategoryId());
                } else {
                    ps.setNull(5, Types.INTEGER); // NULL if no category selected
                }

                int affectedRows = ps.executeUpdate();
                if (affectedRows == 0) {
                    conn.rollback();
                    throw new SQLException("Inserting product failed, no rows affected.");
                }

                // Get the generated product_id
                try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int productId = generatedKeys.getInt(1);
                        p.setProductId(productId); // Set it back to the object
                    } else {
                        conn.rollback();
                        throw new SQLException("Inserting product failed, no ID obtained.");
                    }
                }
            }

            // Insert image URL
            try (PreparedStatement psImg = conn.prepareStatement(insertImage)) {
                psImg.setInt(1, p.getProductId());
                psImg.setString(2, p.getImageUrl());
                psImg.executeUpdate();
            }

            conn.commit(); // Commit transaction
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public List<Product> getProductsByCategoryName(String categoryName) throws ClassNotFoundException {
        Map<Integer, Product> productMap = new HashMap<>();
        String sql = "SELECT p.product_id, p.name, p.description, p.price, p.stock, p.category_id, pi.image_url " +
                     "FROM products p " +
                     "JOIN categories c ON p.category_id = c.category_id " +
                     "LEFT JOIN product_images pi ON p.product_id = pi.product_id " +
                     "WHERE LOWER(c.name) = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, categoryName.toLowerCase());
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");

                // If this product hasn't been added yet, add it
                if (!productMap.containsKey(productId)) {
                    Product product = new Product();
                    product.setProductId(productId);
                    product.setName(rs.getString("name"));
                    product.setDescription(rs.getString("description"));
                    product.setPrice(rs.getDouble("price"));
                    product.setStock(rs.getInt("stock"));
                    product.setCategoryId(rs.getInt("category_id"));
                    product.setImageUrl(
                        rs.getString("image_url") != null ? rs.getString("image_url") : "images/default.jpg"
                    );
                    productMap.put(productId, product);
                }
                
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return new ArrayList<>(productMap.values());
    }
    public List<String> getAllImageUrlsByProductId(int productId) {
        List<String> imageUrls = new ArrayList<>();
        String sql = "SELECT image_url FROM product_images WHERE product_id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                imageUrls.add(rs.getString("image_url"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return imageUrls;
    }
    public List<Product> searchProductsByName(String keyword) throws ClassNotFoundException {
        Map<Integer, Product> productMap = new HashMap<>();
        String sql = "SELECT p.product_id, p.name, p.description, p.price, p.stock, p.category_id, pi.image_url " +
                     "FROM products p " +
                     "LEFT JOIN product_images pi ON p.product_id = pi.product_id " +
                     "WHERE LOWER(p.name) LIKE ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, "%" + keyword.toLowerCase() + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");

                if (!productMap.containsKey(productId)) {
                    Product product = new Product();
                    product.setProductId(productId);
                    product.setName(rs.getString("name"));
                    product.setDescription(rs.getString("description"));
                    product.setPrice(rs.getDouble("price"));
                    product.setStock(rs.getInt("stock"));
                    product.setCategoryId(rs.getInt("category_id"));
                    product.setImageUrl(rs.getString("image_url") != null ? rs.getString("image_url") : "images/default.jpg");
                    productMap.put(productId, product);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return new ArrayList<>(productMap.values());
    }





    }


   

 
