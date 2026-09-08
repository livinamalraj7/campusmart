package com.campusmart.servlet;

import com.campusmart.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    // Get all products
    public List<Product> getAllProducts() {

        List<Product> productList = new ArrayList<>();

        String sql = "SELECT * FROM products";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {

                Product product = new Product();

                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setCategory(resultSet.getString("category"));
                product.setPrice(resultSet.getDouble("price"));
                product.setDescription(resultSet.getString("description"));
                product.setImage(resultSet.getString("image"));

                productList.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return productList;
    }

    // Get products by category
    public List<Product> getProductsByCategory(String category) {

        List<Product> productList = new ArrayList<>();

        String sql = "SELECT * FROM products WHERE category = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setString(1, category);

            try (ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {

                    Product product = new Product();

                    product.setId(resultSet.getInt("id"));
                    product.setName(resultSet.getString("name"));
                    product.setCategory(resultSet.getString("category"));
                    product.setPrice(resultSet.getDouble("price"));
                    product.setDescription(resultSet.getString("description"));
                    product.setImage(resultSet.getString("image"));

                    productList.add(product);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return productList;
    }
}