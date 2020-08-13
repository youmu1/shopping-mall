package com.mpl;

import com.Dao.IProductDAO;
import com.pojo.Product;
import com.Util.DButil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductImpl implements IProductDAO {
    static Connection connection;
    static PreparedStatement statement;
    static ResultSet resultSet;
    static PreparedStatement preparedStatement;

    final String SETPRODUCT = "INSERT INTO easybuy_product(name,description,price,stock,categoryLevel1Id,categoryLevel2Id,categoryLevel3Id,fileName) VALUES(?,?,?,?,?,?,?,?)";
    final String SELECTPRODUCT = "SELECT * FROM easybuy_product order by id desc limit 20 OFFSET ?";
    final String HOWMANYPAGE = "SELECT COUNT(id) FROM easybuy_product";
    final String IDPRRODUCT = "select * from easybuy_product where id = ?";
    final String SelectProductNumber = "select stock from easybuy_product where id = ?";
    final String setProductNumber = "update easybuy_product set stock = ? where id = ?";
    final String delProduct = "delete from easybuy_product where id = ?";
    final String selectByName = "SELECT * FROM easybuy_product WHERE name LIKE ?";

    @Override
    public Boolean addProduct(Product product) throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();
        statement = connection.prepareStatement(SETPRODUCT);
        statement.setString(1,product.getName());
        statement.setString(2,product.getDescription());
        statement.setInt(3,product.getPrice());
        statement.setInt(4,product.getStock());
        statement.setInt(5,product.getCategoryLevel1Id());
        statement.setInt(6,product.getCategoryLevel2Id());
        statement.setInt(7,product.getCategoryLevel3Id());
        statement.setString(8,product.getFileName());
        return statement.execute();
    }

    @Override
    public List getSomeProduct(int index) throws SQLException, ClassNotFoundException {
        ArrayList <Product> arrayList = new ArrayList<>();
        Product product;
        connection = DButil.getConnection();
        statement = connection.prepareStatement(SELECTPRODUCT);
        int tmp = (index-1)*20;
        statement.setInt(1, tmp);
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            product = new Product();
            product.setId(resultSet.getInt("id"));
            product.setName(resultSet.getString("name"));
            product.setDescription(resultSet.getString("description"));
            product.setPrice(resultSet.getInt("price"));
            product.setStock(resultSet.getInt("stock"));
            product.setCategoryLevel1Id(resultSet.getInt("categoryLevel1Id"));
            product.setCategoryLevel2Id(resultSet.getInt("categoryLevel2Id"));
            product.setCategoryLevel3Id(resultSet.getInt("categoryLevel3Id"));
            product.setFileName(resultSet.getString("filename"));
            arrayList.add(product);
        }
        return arrayList;
    }

    @Override
    public int howManyPage() throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();
        statement = connection.prepareStatement(HOWMANYPAGE);
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            return resultSet.getInt("COUNT(id)");
        }
        return 0;
    }

    @Override
    public Product getIdProduct(int id) throws SQLException, ClassNotFoundException {
        Product product = null;
        connection = DButil.getConnection();
        statement = connection.prepareStatement(IDPRRODUCT);
        statement.setInt(1,id);
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            product = new Product();
            product.setId(resultSet.getInt("id"));
            product.setName(resultSet.getString("name"));
            product.setDescription(resultSet.getString("description"));
            product.setPrice(resultSet.getInt("price"));
            product.setStock(resultSet.getInt("stock"));
            product.setCategoryLevel1Id(resultSet.getInt("categoryLevel1Id"));
            product.setCategoryLevel2Id(resultSet.getInt("categoryLevel2Id"));
            product.setCategoryLevel3Id(resultSet.getInt("categoryLevel3Id"));
            product.setFileName(resultSet.getString("filename"));
            return product;
        }
    return product;
    }

    @Override
    public int getProductNumber(int pid) throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();
        statement = connection.prepareStatement(SelectProductNumber);
        statement.setInt(1,pid);
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            return resultSet.getInt("stock");
        }
        return -1;
    }

    @Override
    public Boolean setProductNumber(int pid,int number) throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();
        statement = connection.prepareStatement(setProductNumber);
        statement.setInt(1,number);
        statement.setInt(2,pid);
        return statement.execute();
    }

    @Override
    public Boolean deleteProduct(int pid) throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();
        statement = connection.prepareStatement(delProduct);
        statement.setInt(1,pid);
        return statement.execute();
    }

    @Override
    public List selectByName(String name) throws SQLException, ClassNotFoundException {
        ArrayList <Product> arrayList = new ArrayList<>();
        Product product;
        connection = DButil.getConnection();
        statement = connection.prepareStatement(selectByName);
        statement.setString(1,"%"+name+"%");
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            product = new Product();
            product.setId(resultSet.getInt("id"));
            product.setName(resultSet.getString("name"));
            product.setDescription(resultSet.getString("description"));
            product.setPrice(resultSet.getInt("price"));
            product.setStock(resultSet.getInt("stock"));
            product.setCategoryLevel1Id(resultSet.getInt("categoryLevel1Id"));
            product.setCategoryLevel2Id(resultSet.getInt("categoryLevel2Id"));
            product.setCategoryLevel3Id(resultSet.getInt("categoryLevel3Id"));
            product.setFileName(resultSet.getString("filename"));
            arrayList.add(product);
        }
        return arrayList;
    }
}