package com.Dao;

import java.sql.SQLException;
import java.util.List;
/**
 * @author youmu
 * 用于对新闻的增删改查
 */
public interface INewDAO {
    public List getNews() throws SQLException, ClassNotFoundException;
    public Boolean setNews();
}
