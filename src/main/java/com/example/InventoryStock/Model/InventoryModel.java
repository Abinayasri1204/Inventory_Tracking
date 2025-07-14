package com.example.InventoryStock.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "Inventorydb")
public class InventoryModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String item;
    private String brand;
    private int quantity;
    private double price;

    public InventoryModel() {}

    public InventoryModel(int id, String item, String brand, int quantity, double price) {
        this.id = id;
        this.item = item;
        this.brand = brand;
        this.quantity = quantity;
        this.price = price;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getitem() { return item; }
    public void setitem(String item) { this.item = item; }

    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    @Override
    public String toString() {
        return "InventoryModel [id=" + id + ", item=" + item+ ", brand=" + brand + ", quantity=" + quantity + ", price=" + price + "]";
    }
}
