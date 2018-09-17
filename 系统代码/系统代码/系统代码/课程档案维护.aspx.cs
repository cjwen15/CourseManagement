using System;
using System.Data;

public partial class 课程档案维护 : System.Web.UI.Page
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
        String sql = "select * from 课程档案";
        String sql2 = "select count(*)  from 课程档案";
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
            stuArray = stuList.Rows[nowPage]["课程代号"].ToString() + "," + stuList.Rows[nowPage]["课程名称"].ToString() + "," + stuList.Rows[nowPage]["类别"].ToString() + "," + stuList.Rows[nowPage]["考核方式"].ToString() + "," + stuList.Rows[nowPage]["学分"].ToString() + "," + stuList.Rows[nowPage]["备注"].ToString() + "," + isLast + "," + isFont;
            Response.Write(stuArray);
            Response.End();
        }
        else
        {
            nowPage = 0;//传一条数据给隐藏域
            id.Value = stuList.Rows[nowPage]["课程代号"].ToString();
            name.Value = stuList.Rows[nowPage]["课程名称"].ToString();
            cla.Value = stuList.Rows[nowPage]["类别"].ToString();
            way.Value = stuList.Rows[nowPage]["考核方式"].ToString();
            grade.Value = stuList.Rows[nowPage]["学分"].ToString();
            note.Value = stuList.Rows[nowPage]["备注"].ToString();
        }
    }

    protected void 确认添加_Click(object sender, EventArgs e)
    {
        String id = 课程代号.Text;
        String name = 课程名称.Text;
        String cla = 类别.Text;
        String way = 考核方式.Text;
        String grade = 学分.Text;
        String note = 备注.Text;
        String sql = "insert into 课程档案(课程代号,课程名称,类别,考核方式,学分,备注) values(\"" + id + "\",\"" + name + "\",\"" + cla + "\",\"" + way + "\",\"" + grade + "\",\"" + note + "\")";
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
            Response.Write("<script>alert('添加失败,可能是课程代号重复，超出限度.')</script>");
            return false;
        }
    }


    protected void 删除记录_Click(object sender, EventArgs e)
    {
        String num = 课程代号.Text;
        String sql = "delete from 课程档案 where 课程代号=\"" + num + "\"";
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