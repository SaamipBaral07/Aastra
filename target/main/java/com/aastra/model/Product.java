package com.aastra.model;
public class Product {
    private int productId;
    private String name;
    private String description;
    private double price;
    private int stock;
    private int categoryId;
    private String imageUrl;

    // Getters and setters for all fields
    public int getProductId() { return productId; }
    public void setProductId(int id) { this.productId = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; }

    public int getCategoryId() { return categoryId; }
    public void setCategoryId(int categoryId) { this.categoryId = categoryId; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
}
