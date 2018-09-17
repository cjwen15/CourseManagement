using System;
using System.Data;


public partial class 按性别统计课程的平均成绩查询 : System.Web.UI.Page
{
    Connect_DB db = new Connect_DB();
    protected void Page_Load(object sender, EventArgs e)
    {
        String snowPage = Request.QueryString["nowPage"];
        int nowPage;

        String sql = "select * from 按性别统计课程的平均成绩";
        String sql2 = "select count(*)  from 按性别统计课程的平均成绩";
        DataTable genscoList = db.Query(sql);
        DataTable genscoNum = db.Query(sql2);

        int isLast = 0;
        int isFont = 0;
        int num = int.Parse(genscoNum.Rows[0][0].ToString());
        String genscoArray;

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
            
            genscoArray = genscoList.Rows[nowPage]["性别"].ToString() + "," + genscoList.Rows[nowPage]["课程名称"].ToString() + "," + genscoList.Rows[nowPage]["平均成绩"].ToString() + "," + isLast + "," + isFont;
            Response.Write(genscoArray);
            Response.End();
        }
        else
        {
            nowPage = 0;
            性别.Text = genscoList.Rows[nowPage]["性别"].ToString();
            课程名称.Text = genscoList.Rows[nowPage]["课程名称"].ToString();
            平均成绩.Text = genscoList.Rows[nowPage]["平均成绩"].ToString();
            
            pageNum.Value = num.ToString();
        }
    }
}