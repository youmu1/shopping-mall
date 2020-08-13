package com.mpl;

import com.Dao.INewDAO;
import com.pojo.News;
import com.Util.DButil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NewsImpl implements INewDAO {
    static Connection connection;
    static PreparedStatement statement;
    static ResultSet resultSet;
    final String SELECTNEWS = "SELECT * FROM easybuy_news order by id desc limit 5 OFFSET 0 ";


    public List getNews() throws SQLException, ClassNotFoundException {
        ArrayList<News> arrayList = new ArrayList<>();

        connection = DButil.getConnection();
        statement = connection.prepareStatement(SELECTNEWS);
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            News news = new News();
            news.setId(resultSet.getInt("id"));
            news.setTitle(resultSet.getString("title"));
            news.setContent(resultSet.getString("content"));
            arrayList.add(news);
        }
        return arrayList;
    }

    public Boolean setNews() {
        return null;
    }
}
