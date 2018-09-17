using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 选课及成绩维护 : System.Web.UI.Page
{
    Connect_DB db = new Connect_DB();//记得改链接数据库类的，链接字符串
    protected void Page_Load(object sender, EventArgs e)
    {
        Query();
    }

    protected void Query()
    {
        String snowPage = Request.QueryString["nowPage"];
        int nowPage;
        String sql = "select * from 选课及成绩 查询";
        String sql2 = "select count(*)  from 选课及成绩 查询";
        DataTable stuList = db.Query(sql);
        DataTable stuNum = db.Query(sql2);
        int isLast = 0;
        int isFont = 0;
        int num = int.Parse(stuNum.Rows[0][0].ToString());
        String stuArray;
        pageNum.Value = num.ToString();
        if (snowPage != null)//是否第一次加载
        {//后面post刷新
            nowPage = int.Parse(snowPage) - 1;//当前页面号减1等于对应的datatable的行记录
            if (nowPage == num - 1)
            {
                isLast = 1;//传给前端当前是否是最后页
            }
            if (nowPage == 0)
            {
                isFont = 1;//传给前端当前是否是第一页
            }
            stuArray = stuList.Rows[nowPage]["学号"].ToString() + "," + stuList.Rows[nowPage]["课程代号"].ToString() + "," + stuList.Rows[nowPage]["成绩"].ToString() + "," + stuList.Rows[nowPage]["修课时间"].ToString() + "," + isLast + "," + isFont;
            Response.Write(stuArray);
            Response.End();
        }
        else
        {
            nowPage = 0;//传一条数据给隐藏域
            id.Value = stuList.Rows[nowPage]["学号"].ToString();
            name.Value = stuList.Rows[nowPage]["课程代号"].ToString();
            grade.Value = stuList.Rows[nowPage]["成绩"].ToString();
            time.Value = stuList.Rows[nowPage]["修课时间"].ToString();
        }
    }

    protected void 确认添加_Click(object sender, EventArgs e)
    {
        String num = 学号.Text;
        String name = 课程代号.Text;
        String grade = 成绩.Text;
        String time = 修课时间.Text;
        String sql = "insert into 选课及成绩(学号,课程代号,成绩,修课时间) values(\"" + num + "\",\"" + name + "\",\"" + grade + "\",\"" + time + "\")";
        Insert(sql);
    }

    protected bool Insert(string sql)
    {
        try
        {
            bool t = db.Insert(sql);
            Response.Write("<script>alert('添加成功')</script>");
            return t;
        }
        catch
        {
            Response.Write("<script>alert('添加失败,请检查学号，课程代号是否存在.')</script>");
            return false;
        }
    }


    protected void 删除记录_Click(object sender, EventArgs e)
    {
        String num = 学号.Text;
        String sql = "delete from 选课及成绩 where 学号=\"" + num + "\"";
        Delete(sql);
    }

    protected void Delete(string sql)
    {
        try
        {
            db.Delete(sql);
            Response.Write("<script>alert('删除成功')</script>");
        }
        catch
        {
            Response.Write("<script>alert('删除失败，请稍后尝试')</script>");
        }
    }
}