package com.mpl;

import com.Dao.IHistoryDAO;
import com.pojo.History;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class HistoryImpl implements IHistoryDAO {
    static Connection connection;
    static PreparedStatement statement;
    static ResultSet resultSet;

    @Override
    public Boolean addHistory(History history) {
        return null;
    }

    @Override
    public List selHistory(int uid) {
        return null;
    }

    @Override
    public Boolean deleteHistory(int uid) {
        return null;
    }
}
