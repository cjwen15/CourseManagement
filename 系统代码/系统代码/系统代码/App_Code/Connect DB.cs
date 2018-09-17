using System;
using System.Data;
using System.Data.OleDb;

/// <summary>
/// Connect_Access 的摘要说明
/// </summary>
public class Connect_DB
{
    //链接字符串要改
    OleDbConnection oleDb = new OleDbConnection(@"Provider = Microsoft.Jet.OLEDB.4.0; Data Source = C:\Users\KlayWen\Desktop\CourseManagement\系统代码\系统代码\系统代码\App_Data\应用系统开发实例 教学管理系统.mdb");
    public  Connect_DB()
    {
        oleDb.Open();
    }
    public DataTable Query(string sql)//select * from 
    {
        OleDbDataAdapter dbDataAdapter = new OleDbDataAdapter(sql,oleDb); //创建适配对象
        DataTable dt = new DataTable(); //新建表对象
        dbDataAdapter.Fill(dt);
        return dt;
    }
    public int CountRow(string sql)
    {
        OleDbCommand oleDbCommand = new OleDbCommand(sql, oleDb);
        int i = Convert.ToInt32(oleDbCommand.ExecuteScalar()); //返回被修改的数目
        return i;
    }
    public bool Insert(string sql)
    {
        OleDbCommand oleDbCommand = new OleDbCommand(sql, oleDb);
        int i = oleDbCommand.ExecuteNonQuery(); //返回被修改的数目
        return i > 0;
    }
    public bool Delete(string sql)
    {
        OleDbCommand oleDbCommand = new OleDbCommand(sql, oleDb);
        int i = oleDbCommand.ExecuteNonQuery();
        return i > 0;
    }
}