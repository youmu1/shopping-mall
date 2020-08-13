package com.Dao;

import com.pojo.Product;

import java.sql.SQLException;
import java.util.List;
/**
 * @author youmu
 * 用于对商品的增删改查
 */
public interface IProductDAO {
public Boolean addProduct(Product product) throws SQLException, ClassNotFoundException;
public List getSomeProduct(int index) throws SQLException, ClassNotFoundException;
public int howManyPage() throws SQLException, ClassNotFoundException;
public Product getIdProduct(int id) throws SQLException, ClassNotFoundException;
public int getProductNumber(int pid) throws SQLException, ClassNotFoundException;
public Boolean setProductNumber(int pid , int number) throws SQLException, ClassNotFoundException;
public Boolean deleteProduct(int pid) throws SQLException, ClassNotFoundException;
public List selectByName(String name) throws SQLException, ClassNotFoundException;
}
