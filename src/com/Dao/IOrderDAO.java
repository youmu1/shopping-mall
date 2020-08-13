package com.Dao;

import com.pojo.Order;

import java.sql.SQLException;
import java.util.List;
/**
 * @author youmu
 * 用于对订单的增删改查
 */
public interface IOrderDAO {
    public Boolean addOrder(Order order) throws SQLException, ClassNotFoundException;
    public List selectOrderList(String ssid) throws SQLException, ClassNotFoundException;
    public List selectMyOrderList(String uid) throws SQLException, ClassNotFoundException;
}
