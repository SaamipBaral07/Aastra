package com.aastra.model;

public class OrderItem {
    private Product product;
    private int quantity;
    private double unitPrice;

    // Getters and Setters

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    // Optional: You can add a method to get total price per item
    public double getTotalPrice() {
        return this.unitPrice * this.quantity;
    }
}
