package com.Dao;

import com.pojo.History;

import java.util.List;

public interface IHistoryDAO {
    public Boolean addHistory(History history);
    public List selHistory(int uid);
    public Boolean deleteHistory(int uid);
}
