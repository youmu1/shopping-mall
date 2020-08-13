package com.mpl;

import com.Dao.IBuyCarDAO;
import com.Dao.IProductDAO;
import com.pojo.BuyCar;
import com.pojo.Product;
import com.Util.DButil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BuyCarImpl implements IBuyCarDAO {
    static Connection connection;
    static PreparedStatement statement;
    static ResultSet resultSet;

    final String INSERTPRODUCT = "INSERT INTO easybuy_shopping_cart (UID,PID,name,filename,PRICE,NUMBER) VALUES(?,?,?,?,?,?)";
    final String DELETEPRODUCT = "DELETE FROM easybuy_shopping_cart WHERE id = ?";
    final String SELECTPRODUCT = "SELECT * FROM easybuy_shopping_cart WHERE UID = ?";
    final String UPDATEPRODUCT = "UPDATE easybuy_shopping_cart SET NUMBER=? WHERE ID=?";
    final String ISNEWPRODUCT = "SELECT count(number) number FROM easybuy_shopping_cart WHERE UID = ? and PID = ?";
    final String ADDNUMBER = "UPDATE easybuy_shopping_cart SET NUMBER = NUMBER+1 WHERE UID = ? and PID = ?";
    final String SUBNUMBER = "UPDATE easybuy_shopping_cart SET NUMBER = NUMBER-1 WHERE UID = ? and PID = ?";
    final String DELALL = "DELETE FROM easybuy_shopping_cart WHERE uid = ?";
    final String HOWTOADD = "UPDATE easybuy_shopping_cart SET NUMBER = NUMBER+? WHERE UID = ? and PID = ?";
    final String SETNEWNUMBER = "UPDATE easybuy_shopping_cart SET NUMBER=? WHERE UID=? and PID=?";
    @Override
    public Boolean addProduct(int uid, int pid, int number) throws SQLException, ClassNotFoundException {
        IProductDAO iProductDAO = new ProductImpl();
        Product product = iProductDAO.getIdProduct(pid);
        connection = DButil.getConnection();
        statement = connection.prepareStatement(INSERTPRODUCT);
        statement.setInt(1,uid);
        statement.setInt(2,pid);
        statement.setString(3,product.getName());
        statement.setString(4,product.getFileName());
        statement.setInt(5,product.getPrice());
        statement.setInt(6,number);
        return statement.execute();
    }

    @Override
    public BuyCar selectProductById(int id) {
        return null;
    }

    @Override
    public Boolean delProduct(int id) throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();
        statement = connection.prepareStatement(DELETEPRODUCT);
        statement.setInt(1,id);
        return statement.execute();
    }

    @Override
    public Boolean delAllProduct(int uid) throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();
        statement = connection.prepareStatement(DELALL);
        statement.setInt(1,uid);
        return statement.execute();
    }

    @Override
    public List selectProduct(int uid) throws SQLException, ClassNotFoundException {
        BuyCar buyCar;
        ArrayList<BuyCar> arrayList = new ArrayList<>();
        connection = DButil.getConnection();
        statement = connection.prepareStatement(SELECTPRODUCT);
        statement.setInt(1,uid);
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            buyCar = new BuyCar();
            buyCar.setId(resultSet.getInt("ID"));
            buyCar.setName(resultSet.getString("name"));
            buyCar.setUid(resultSet.getInt("UID"));
            buyCar.setPrice(resultSet.getInt("PRICE"));
            buyCar.setFilename(resultSet.getString("filename"));
            buyCar.setPid(resultSet.getInt("PID"));
            buyCar.setNumber(resultSet.getInt("NUMBER"));
            arrayList.add(buyCar);
        }
        return arrayList;
    }

    @Override
    public Boolean changeProduct(BuyCar buyCar) throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();
        statement = connection.prepareStatement(UPDATEPRODUCT);
        statement.setInt(1,buyCar.getNumber());
        statement.setInt(2,buyCar.getId());
        return statement.execute();
    }

    @Override
    public int isNewProduct(int uid, int pid) throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();
        statement = connection.prepareStatement(ISNEWPRODUCT);
        statement.setInt(1,uid);
        statement.setInt(2,pid);
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            if (resultSet.getInt("NUMBER")==1) {
                return resultSet.getInt("NUMBER");
            }
        }
        return -1;
    }

    @Override
    public Boolean addNewNumber(int uid, int pid) throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();

        if (isNewProduct(uid,pid)!=-1) {
            statement = connection.prepareStatement(ADDNUMBER);
            statement.setInt(1,uid);
            statement.setInt(2,pid);
            return statement.execute();
        }else {
            return addProduct(uid,pid,1);
        }
    }

    @Override
    public Boolean subNumber(int uid, int pid) throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();
        if (isNewProduct(uid,pid)==0)return false;
        if (isNewProduct(uid,pid)>0) {
            statement = connection.prepareStatement(SUBNUMBER);
            statement.setInt(1,uid);
            statement.setInt(2,pid);
            return statement.execute();
        }else {
            return addProduct(uid,pid,1);
        }
    }

    @Override
    public Boolean howAdd(int uid, int pid, int number) throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();

        if (isNewProduct(uid,pid)!=-1) {
            statement = connection.prepareStatement(HOWTOADD);
            statement.setInt(1,number);
            statement.setInt(2,uid);
            statement.setInt(3,pid);
            return statement.execute();
        }else {
            return addProduct(uid,pid,number);
        }

    }

    @Override
    public Boolean allAdd(List<BuyCar> buyCarList) {
        return null;
    }

    @Override
    public Boolean setNewNumber(int uid,int pid,int number) throws SQLException, ClassNotFoundException {
        connection = DButil.getConnection();
        statement = connection.prepareStatement(SETNEWNUMBER);
        statement.setInt(1,number);
        statement.setInt(2,uid);
        statement.setInt(3,pid);
        return statement.execute();
    }

//    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        System.out.println(new BuyCarImpl().isNewProduct(10,31));
//    }
}
