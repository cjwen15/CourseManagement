using System;
using System.Data;

public partial class 各院系按课程的平均成绩查询 : System.Web.UI.Page
{
    Connect_DB db = new Connect_DB();
    protected void Page_Load(object sender, EventArgs e)
    {
        String snowPage = Request.QueryString["nowPage"];
        int nowPage;

        String sql = " select * from 各院系按课程的平均成绩查询";

        String sql2 = "select count(*)  from 各院系按课程的平均成绩查询";
        DataTable acscoList = db.Query(sql);
        DataTable acscoNum = db.Query(sql2);
        
        int isLast = 0;
        int isFont = 0;
        int num = int.Parse(acscoNum.Rows[0][0].ToString());
        String acscoArray;

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
            acscoArray = acscoList.Rows[nowPage]["院系名称"].ToString() + "," + acscoList.Rows[nowPage]["课程名称"].ToString() + "," + acscoList.Rows[nowPage]["平均成绩"].ToString() + "," + isLast + "," + isFont;
            Response.Write(acscoArray);
            Response.End();
        }
        
        {
            nowPage = 0;
            院系名称.Text = acscoList.Rows[nowPage]["院系名称"].ToString();
            课程名称.Text = acscoList.Rows[nowPage]["课程名称"].ToString();
            平均成绩.Text = acscoList.Rows[nowPage]["平均成绩"].ToString();
            pageNum.Value = num.ToString();
        }
    }
}