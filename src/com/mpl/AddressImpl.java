package com.mpl;

import com.Dao.IAddressDAO;
import com.pojo.Address;
import com.Util.DButil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AddressImpl implements IAddressDAO {
    static Connection connection;
    static PreparedStatement statement;
    static ResultSet resultSet;

    final String SELECTID = "SELECT * FROM user_address WHERE userId = ?";
    final String INSERT = "INSERT INTO user_address(userId,name,tel,email,address,postal,Time,express)VALUES(?,?,?,?,?,?,?,?)";
    final String DELETE = "DELETE FROM user_address WHERE id = ?";
    final String SELBYID = "select * from user_address where id = ?";

    @Override
    public Boolean addAddress(Address address) throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();
        statement = connection.prepareStatement(INSERT);
        statement.setInt(1,address.getUid());
        statement.setString(2,address.getName());
        statement.setString(3,address.getTel());
        statement.setString(4,address.getEmail());
        statement.setString(5,address.getAddress());
        statement.setInt(6,address.getPost());
        statement.setString(7,address.getTime());
        statement.setString(8,address.getExpress());
        return statement.execute();
    }

    @Override
    public Boolean delAddress(int id) throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();
        statement = connection.prepareStatement(DELETE);
        statement.setInt(1,id);
        return statement.execute();
    }

    @Override
    public List selAddress(int uid) throws SQLException, ClassNotFoundException {
        ArrayList<Address> arrayList = new ArrayList<>();
        Address addr;
        connection = DButil.getConnection();
        statement = connection.prepareStatement(SELECTID);
        statement.setInt(1,uid);
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            addr = new Address();
            addr.setId(resultSet.getInt("id"));
            addr.setUid(resultSet.getInt("userId"));
            addr.setName(resultSet.getString("name"));
            addr.setTel(resultSet.getString("tel"));
            addr.setEmail(resultSet.getString("email"));
            addr.setAddress(resultSet.getString("address"));
            addr.setPost(resultSet.getInt("postal"));
            addr.setTime(resultSet.getString("Time"));
            addr.setExpress(resultSet.getString("express"));
            arrayList.add(addr);
        }
        return arrayList;
    }

    @Override
    public Boolean updateAddress(Address address) throws SQLException, ClassNotFoundException {
        delAddress(address.getId());
        return addAddress(address);
    }

    @Override
    public Address selectById(int id) throws SQLException, ClassNotFoundException {
        Address address = null;
        connection = DButil.getConnection();
        statement = connection.prepareStatement(SELBYID);
        statement.setInt(1,id);
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            address = new Address();
            address.setId(resultSet.getInt("id"));
            address.setUid(resultSet.getInt("userid"));
            address.setName(resultSet.getString("name"));
            address.setTel(resultSet.getString("tel"));
            address.setEmail(resultSet.getString("email"));
            address.setAddress(resultSet.getString("address"));
            address.setPost(resultSet.getInt("postal"));
            address.setTime(resultSet.getString("Time"));
            address.setExpress(resultSet.getString("express"));
        }
        return address;
    }
}
