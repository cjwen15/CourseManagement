using System;
using System.Data;

public partial class 教师情况 : System.Web.UI.Page
{
    Connect_DB db = new Connect_DB();
    protected void Page_Load(object sender, EventArgs e)
    {
        String snowPage = Request.QueryString["nowPage"];
        int nowPage;

        String sql = "select * from 教师情况";
        String sql2 = "select count(*)  from 教师情况";
        DataTable teacherList = db.Query(sql);
        DataTable teacherNum = db.Query(sql2);

        int isLast = 0;
        int isFont = 0;
        int num = int.Parse(teacherNum.Rows[0][0].ToString());
        String teacherArray;

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
            
            teacherArray = teacherList.Rows[nowPage]["教师编号"].ToString() + "," + teacherList.Rows[nowPage]["姓名"].ToString() + "," + teacherList.Rows[nowPage]["性别"].ToString() + "," + teacherList.Rows[nowPage]["职称"].ToString() + ","  + isLast + "," + isFont;
            Response.Write(teacherArray);
            Response.End();
        }
        else
        {
            nowPage = 0;
            教师编号.Text = teacherList.Rows[nowPage]["教师编号"].ToString();
            姓名.Text = teacherList.Rows[nowPage]["姓名"].ToString();
            性别.Text = teacherList.Rows[nowPage]["性别"].ToString();
            职称.Text = teacherList.Rows[nowPage]["职称"].ToString();
            pageNum.Value = num.ToString();
        }
    }
}