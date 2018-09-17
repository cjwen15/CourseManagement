using System;
using System.Data;

public partial class 课程档案 : System.Web.UI.Page
{
    Connect_DB db = new Connect_DB();
    protected void Page_Load(object sender, EventArgs e)
    {
        String snowPage = Request.QueryString["nowPage"];
        int nowPage;

        String sql = "select * from 课程档案";
        String sql2 = "select count(*)  from 课程档案";
        DataTable courseList = db.Query(sql);
        DataTable courseNum = db.Query(sql2);

        int isLast = 0;
        int isFont = 0;
        int num = int.Parse(courseNum.Rows[0][0].ToString());
        String courseArray;

        if (snowPage != null)//是否第一次加载
        {//后面post刷新
            nowPage = int.Parse(snowPage) - 1;//当前页面号减1等于对应的datatable的行记录
            if (nowPage == num - 1)
            {
                isLast = 1;
            }
            if (nowPage == 0)
            {
                isFont = 1;
            }
            courseArray = courseList.Rows[nowPage]["课程代号"].ToString() + "," + courseList.Rows[nowPage]["课程名称"].ToString() + "," + courseList.Rows[nowPage]["类别"].ToString() + "," + courseList.Rows[nowPage]["考核方式"].ToString() + "," + courseList.Rows[nowPage]["学分"].ToString() + "," + courseList.Rows[nowPage]["备注"].ToString() + ","  + isLast + "," + isFont;
            Response.Write(courseArray);
            Response.End();
        }
        else
        {
            nowPage = 0;
            课程代号.Text = courseList.Rows[nowPage]["课程代号"].ToString();
            课程名称.Text = courseList.Rows[nowPage]["课程名称"].ToString();
            类别.Text = courseList.Rows[nowPage]["类别"].ToString();
            考核方式.Text = courseList.Rows[nowPage]["考核方式"].ToString();
            学分.Text = courseList.Rows[nowPage]["学分"].ToString();
            备注.Text = courseList.Rows[nowPage]["备注"].ToString();
            pageNum.Value = num.ToString();
        }
    }
}