package com.Dao;

import com.pojo.BuyCar;

import java.sql.SQLException;
import java.util.List;
/**
 * @author youmu
 * 用于对购物车的增删改查
 */
public interface IBuyCarDAO {
    public Boolean addProduct(int uid,int pid,int number) throws SQLException, ClassNotFoundException;
    public BuyCar selectProductById(int id );
    public Boolean delProduct(int id) throws SQLException, ClassNotFoundException;
    public Boolean delAllProduct(int uid) throws SQLException, ClassNotFoundException;
    public List selectProduct(int uid) throws SQLException, ClassNotFoundException;
    public Boolean changeProduct(BuyCar buyCar) throws SQLException, ClassNotFoundException;
    public int isNewProduct(int uid , int pid) throws SQLException, ClassNotFoundException;
    public Boolean addNewNumber(int uid,int pid) throws SQLException, ClassNotFoundException;
    public Boolean subNumber(int uid ,int pid) throws SQLException, ClassNotFoundException;
    public Boolean howAdd(int uid,int pid,int number) throws SQLException, ClassNotFoundException;
    public Boolean allAdd(List<BuyCar> buyCarList);
    public Boolean setNewNumber(int uid,int pid,int number) throws SQLException, ClassNotFoundException;
}
