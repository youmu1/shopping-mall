package com.Util;

import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class DButil {
    static Connection connection;
    static Properties properties;
    static {
        try {
            InputStream inputStream = DButil.class.getClassLoader().getResourceAsStream("com/Util/proper.properties");
            properties = new Properties();
            properties.load(inputStream);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        String url = properties.getProperty("url");
        String user = properties.getProperty("user");
        String password = properties.getProperty("password");
        Class.forName(properties.getProperty("driverClass"));
        connection = DriverManager.getConnection(url, user, password);
        return connection;
    }
    public static void close(Connection connection, Statement statement, ResultSet resultSet) throws SQLException {
        if (connection != null)connection.close();
        if (statement != null)statement.close();
        if (resultSet != null)resultSet.close();
    }
}
