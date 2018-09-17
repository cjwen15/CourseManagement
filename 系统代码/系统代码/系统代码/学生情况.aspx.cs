using System;
using System.Data;

public partial class 学生情况 : System.Web.UI.Page
{
    Connect_DB db = new Connect_DB();//记得改链接数据库类的，链接字符串
    protected void Page_Load(object sender, EventArgs e)
    {
        String snowPage = Request.QueryString["nowPage"];
        int nowPage;

        String sql = "select * from 学生情况";
        String sql2 = "select count(*)  from 学生情况";
        DataTable stuList = db.Query(sql);
        DataTable stuNum = db.Query(sql2);

        int isLast = 0;
        int isFont = 0;
        int num = int.Parse(stuNum.Rows[0][0].ToString());
        String stuArray;

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
            string index = stuList.Rows[nowPage]["是否住宿"].ToString() == "True" ? "是" : "否";
            stuArray = stuList.Rows[nowPage]["学号"].ToString() + "," + stuList.Rows[nowPage]["姓名"].ToString() + "," + stuList.Rows[nowPage]["性别"].ToString() + "," + stuList.Rows[nowPage]["出生日期"].ToString() + "," + stuList.Rows[nowPage]["生源地"].ToString() + "," + stuList.Rows[nowPage]["政治面貌"].ToString() + "," + index + "," + stuList.Rows[nowPage]["宿舍电话"].ToString() + "," + isLast + "," + isFont;
            Response.Write(stuArray);
            Response.End();
        }
        else
        {
            nowPage = 0;
            学号.Text= stuList.Rows[nowPage]["学号"].ToString();
            姓名.Text = stuList.Rows[nowPage]["姓名"].ToString();
            性别.Text = stuList.Rows[nowPage]["性别"].ToString();
            出生日期.Text = stuList.Rows[nowPage]["出生日期"].ToString();
            生源地.Text = stuList.Rows[nowPage]["生源地"].ToString();
            政治面貌.Text = stuList.Rows[nowPage]["政治面貌"].ToString();
            是否住宿.Text = stuList.Rows[nowPage]["是否住宿"].ToString() == "True" ? "是" : "否";
            宿舍电话.Text = stuList.Rows[nowPage]["宿舍电话"].ToString();
            pageNum.Value = num.ToString();
        }
    }

    
}