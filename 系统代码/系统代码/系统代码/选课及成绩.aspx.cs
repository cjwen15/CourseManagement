using System;
using System.Data;
public partial class 选课及成绩 : System.Web.UI.Page
{
    Connect_DB db = new Connect_DB();
    protected void Page_Load(object sender, EventArgs e)
    {
        String snowPage = Request.QueryString["nowPage"];
        int nowPage;

        String sql = "select * from 选课及成绩";
        String sql2 = "select count(*)  from 选课及成绩";
        DataTable selscoList = db.Query(sql);
        DataTable selscoNum = db.Query(sql2);

        int isLast = 0;
        int isFont = 0;
        int num = int.Parse(selscoNum.Rows[0][0].ToString());
        String selscoArray;

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
            
            selscoArray = selscoList.Rows[nowPage]["学号"].ToString() + "," + selscoList.Rows[nowPage]["课程代号"].ToString() + "," + selscoList.Rows[nowPage]["成绩"].ToString() + "," + selscoList.Rows[nowPage]["修课时间"].ToString() + "," + selscoList.Rows[nowPage]["备注"].ToString() + ","  +  "," + isLast + "," + isFont;
            Response.Write(selscoArray);
            Response.End();
        }
        else
        {
            nowPage = 0;
            学号.Text = selscoList.Rows[nowPage]["学号"].ToString();
            课程代号.Text = selscoList.Rows[nowPage]["课程代号"].ToString();
            成绩.Text = selscoList.Rows[nowPage]["成绩"].ToString();
            修课时间.Text = selscoList.Rows[nowPage]["修课时间"].ToString();
            备注.Text = selscoList.Rows[nowPage]["备注"].ToString();
            pageNum.Value = num.ToString();
        }
    }
}