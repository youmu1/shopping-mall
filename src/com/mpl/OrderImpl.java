package com.mpl;

import com.Dao.IOrderDAO;
import com.pojo.Order;
import com.Util.DButil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderImpl implements IOrderDAO {
    static Connection connection;
    static PreparedStatement statement;
    static ResultSet resultSet;



    final String INSERT = "INSERT INTO easybuy_order(id,userId,pid,pname,price,number,username,tel,email,address,postal,express) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
    final String SELECT = "SELECT * FROM easybuy_order where id = ?";
    final String SELECTMy = "SELECT * FROM easybuy_order where userid = ?";
    @Override
    public Boolean addOrder(Order order) throws SQLException, ClassNotFoundException {
//        INSERT INTO easybuy_order(id,userId,pid,pname,price,number,username,tel,email,address,postal,express) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)
        connection = DButil.getConnection();
        statement = connection.prepareStatement(INSERT);
        statement.setString(1, order.getId());
        statement.setInt(2, order.getUid());
        statement.setInt(3,order.getPid());
        statement.setString(4,order.getPname());
        statement.setInt(5,order.getPrice());
        statement.setInt(6,order.getNumber());
        statement.setString(7,order.getUsername());
        statement.setString(8,order.getTel());
        statement.setString(9,order.getEmail());
        statement.setString(10,order.getAddress());
        statement.setInt(11,order.getPostal());
        statement.setString(12,order.getExpress());
        return statement.execute();
    }

    @Override
    public List selectOrderList(String ssid) throws SQLException, ClassNotFoundException {
        ArrayList<Order> arrayList = new ArrayList<>();
        Order order;
        connection = DButil.getConnection();
        statement = connection.prepareStatement(SELECT);
        statement.setString(1,ssid);
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            order = new Order();
            order.setId(resultSet.getString("id"));
            order.setUid(resultSet.getInt("userId"));
            order.setPid(resultSet.getInt("pid"));
            order.setPname(resultSet.getString("pname"));
            order.setPrice(resultSet.getInt("price"));
            order.setNumber(resultSet.getInt("number"));
            order.setUsername(resultSet.getString("username"));
            order.setTel(resultSet.getString("tel"));
            order.setEmail(resultSet.getString("email"));
            order.setAddress(resultSet.getString("address"));
            order.setPostal(resultSet.getInt("postal"));
            order.setExpress(resultSet.getString("express"));
            arrayList.add(order);
        }
        return arrayList;
    }
    public List selectMyOrderList(String uid) throws SQLException, ClassNotFoundException {
        ArrayList<Order> arrayList = new ArrayList<>();
        Order order;
        connection = DButil.getConnection();
        statement = connection.prepareStatement(SELECTMy);
        statement.setString(1,uid);
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            order = new Order();
            order.setId(resultSet.getString("id"));
            order.setUid(resultSet.getInt("userId"));
            order.setPid(resultSet.getInt("pid"));
            order.setPname(resultSet.getString("pname"));
            order.setPrice(resultSet.getInt("price"));
            order.setNumber(resultSet.getInt("number"));
            order.setUsername(resultSet.getString("username"));
            order.setTel(resultSet.getString("tel"));
            order.setEmail(resultSet.getString("email"));
            order.setAddress(resultSet.getString("address"));
            order.setPostal(resultSet.getInt("postal"));
            order.setExpress(resultSet.getString("express"));
            arrayList.add(order);
        }
        return arrayList;
    }
}
