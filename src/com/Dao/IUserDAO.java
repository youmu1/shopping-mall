package com.Dao;

import com.pojo.User;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

/**
 * @author youmu
 *  * 用于对用户属性的增删改查
 *
 */
public interface IUserDAO {

    public Boolean setUser(User user) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException;

    public Boolean isMyUser(User user) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException;

    public Boolean setDeleteUser(User user) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException;

    public Boolean modifyPassword(User user) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException;

    public String isMyEmail(String email) throws SQLException, ClassNotFoundException;

    public Boolean setNewPassword(String ID,String password) throws SQLException, ClassNotFoundException;

    public Boolean isNewName(String username) throws SQLException, ClassNotFoundException;

    public User isMyUserq(User user) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException;

    public String selectUsernameReturnEmail(String username) throws SQLException, ClassNotFoundException;
}
