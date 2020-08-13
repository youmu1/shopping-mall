package com.mpl;

import com.Util.DButil;
import com.Dao.IUserDAO;
import com.pojo.User;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

public class UserImpl implements IUserDAO {
    static Connection connection;
    static PreparedStatement statement;
    static ResultSet resultSet;

    final String INSETSQL = "INSERT INTO easybuy_user (loginName,userName,pwd,sex,identityCode,email,mobile,type) VALUES(?,?,?,?,?,?,?,?)";

    final String SELECTUSE = "SELECT * FROM easybuy_user where userName = ?";

    final String DELETEUSER = "DELETE FROM easybuy_user WHERE userName = ?";

    final String MODIFYPASSWORD = "UPDATE easybuy_user SET pwd= ? WHERE id = ?";

    final String SELECTEMAIL = "SELECT * FROM user WHERE EMAIL = ?";

    final String SETNEWPASSWORD = "UPDATE `user` SET `PASSWORD` = ? WHERE UID = ?";

    final String ISNEWUSER = "SELECT userName FROM easybuy_user WHERE userName=?";

    final String SELUSERNAME = "select EMAIL from easybuy_user where userName = ?";

    


    private String getMD5(String str) throws NoSuchAlgorithmException {
        MessageDigest md5 = MessageDigest.getInstance("md5");
        byte[] b = str.getBytes();
        byte[] digest = md5.digest(b);
        char[] chars = new char[] { '0', '1', '2', '3', '4', '5',
                '6', '7' , '8', '9', 'A', 'B', 'C', 'D', 'E','F' };
        StringBuffer sb = new StringBuffer();
        for (byte bb : digest) {
            sb.append(chars[(bb >> 4) & 15]);
            sb.append(chars[bb & 15]);
        }
        return sb.toString();
    }


    //注册
    public Boolean setUser(User user) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException {
        user.setPassword(getMD5(user.getPassword()));
        connection = DButil.getConnection();
        statement = connection.prepareStatement(INSETSQL);
        statement.setString(1,user.getUsername());
        statement.setString(2,user.getUsername());
        statement.setString(3,user.getPassword());
        statement.setInt(4,user.getSex());
        statement.setString(5,user.getIdentityCode());
        statement.setString(6,user.getEmail());
        statement.setString(7,user.getPhoneNumber());
        statement.setInt(8,user.getType());
        statement.execute();
        DButil.close(connection,statement,resultSet);
        return true;
    }
    //登录
    public Boolean isMyUser(User user) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException {
        connection = DButil.getConnection();
        statement = connection.prepareStatement(SELECTUSE);
        user.setPassword(getMD5(user.getPassword()));
        statement.setString(1,user.getUsername());
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            if (resultSet.getString("userName").equals(user.getUsername()) && resultSet.getString("pwd").equals(user.getPassword())){
                DButil.close(connection,statement,resultSet);
                return true;
            }
            else return false;
        }
        return false;
    }
    public User isMyUserq(User user) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException {
        connection = DButil.getConnection();
        statement = connection.prepareStatement(SELECTUSE);
        user.setPassword(getMD5(user.getPassword()));
        statement.setString(1,user.getUsername());
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            if (resultSet.getString("userName").equals(user.getUsername()) && resultSet.getString("pwd").equals(user.getPassword())){
                user.setEmail(resultSet.getString("email"));
                user.setId(resultSet.getInt("ID"));
                return user;
            }
            else return user;
        }
        return user;
    }


    //查询用户的email
    @Override
    public String selectUsernameReturnEmail(String username) throws SQLException, ClassNotFoundException {
        String email = null;
        connection = DButil.getConnection();
        statement = connection.prepareStatement(SELUSERNAME);
        statement.setString(1,username);
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            email = resultSet.getString("EMAIL");
        }
        return email;
    }


//删除用户

    public Boolean setDeleteUser(User user) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException {
    if (user == null)return false;
    if (!isMyUser(user))return false;
        connection = DButil.getConnection();
        statement = connection.prepareStatement(DELETEUSER);
        statement.setString(1,user.getUsername());
        if (statement.execute()) return false;
        else return true;
    }


    //修改密码
    public Boolean modifyPassword(User user) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException {
        if (!isMyUser(user))return false;
            connection = DButil.getConnection();
            statement = connection.prepareStatement(MODIFYPASSWORD);
            statement.setString(1,user.getPassword());
            statement.setInt(2,user.getId());
            if (statement.execute()) {
                DButil.close(connection,statement,resultSet);
                return false;
            }
            else return true;
    }


    //查询返回id
    public String isMyEmail(String email) throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();
        statement = connection.prepareStatement(SELECTEMAIL);
        statement.setString(1,email);
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            if (resultSet.getString("EMAIL").equals(email))return resultSet.getString("UID");
        }
        return null;
    }


    public Boolean setNewPassword(String ID,String password) throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();
        statement = connection.prepareStatement(SETNEWPASSWORD);
        statement.setString(1,password);
        statement.setString(2,ID);
        statement.execute();
        DButil.close(connection,statement,resultSet);
        return true;
    }

    @Override
    public Boolean isNewName(String username) throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();
        statement = connection.prepareStatement(ISNEWUSER);
        statement.setString(1,username);
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            if (resultSet.getString("userName").equals(username))return false;
        }
        return true;
    }

}