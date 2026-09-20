package com.campusmart.servlet;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
            System.getenv("DB_URL") != null
                    ? System.getenv("DB_URL")
                    : "jdbc:mysql://localhost:3306/campusmart"
                    + "?useUnicode=true"
                    + "&characterEncoding=UTF-8"
                    + "&connectionCollation=utf8mb4_unicode_ci";

    private static final String USER =
            System.getenv("DB_USER") != null
                    ? System.getenv("DB_USER")
                    : "root";

    private static final String PASSWORD =
            System.getenv("DB_PASSWORD") != null
                    ? System.getenv("DB_PASSWORD")
                    : "";

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

        } catch (Exception e) {

            e.printStackTrace();
            return null;
        }
    }
}