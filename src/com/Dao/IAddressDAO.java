package com.Dao;

import com.pojo.Address;

import java.sql.SQLException;
import java.util.List;

/**
 * @author youmu
 * 用于对订单地址的增删改查
 */
public interface IAddressDAO {
    public Boolean addAddress(Address address) throws SQLException, ClassNotFoundException;
    public Boolean delAddress(int id) throws SQLException, ClassNotFoundException;
    public List selAddress(int uid) throws SQLException, ClassNotFoundException;
    public Boolean updateAddress(Address address) throws SQLException, ClassNotFoundException;
    public Address selectById(int id) throws SQLException, ClassNotFoundException;
}
