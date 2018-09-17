using System;
using System.Data;

public partial class 学生情况维护 : System.Web.UI.Page
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
        String sql = "select * from 学生情况 查询";
        String sql2 = "select count(*)  from 学生情况 查询";
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
            string index = stuList.Rows[nowPage]["是否住宿"].ToString() == "True" ? "是" : "否";
            string sex = stuList.Rows[nowPage]["性别"].ToString() == "男" ? "男" : "女";
            stuArray = stuList.Rows[nowPage]["学号"].ToString() + "," + stuList.Rows[nowPage]["姓名"].ToString() + "," + sex + "," + stuList.Rows[nowPage]["出生日期"].ToString() + "," + stuList.Rows[nowPage]["生源地"].ToString() + "," + index + "," + stuList.Rows[nowPage]["宿舍电话"].ToString() + "," + isLast + "," + isFont;
            Response.Write(stuArray);
            Response.End();
        }
        else
        {
            nowPage = 0;//传一条数据给隐藏域
            id.Value = stuList.Rows[nowPage]["学号"].ToString();
            name.Value = stuList.Rows[nowPage]["姓名"].ToString();
            String sexual = stuList.Rows[nowPage]["性别"].ToString();
            if (sexual == "男") { sex.Value = sexual; }
            else { sex.Value = sexual; }
            birthday.Value = stuList.Rows[nowPage]["出生日期"].ToString();
            origion.Value = stuList.Rows[nowPage]["生源地"].ToString();
            String dro = stuList.Rows[nowPage]["是否住宿"].ToString();
            if (dro == "True") { dor.Value = "是"; }
            else { dor.Value = "否"; }
            phone.Value = stuList.Rows[nowPage]["宿舍电话"].ToString();
        }
    }

    protected void 确认添加_Click(object sender, EventArgs e)//添加记录,要在链接类加插入方法
    {
        String num = 学号.Text;
        String name = 姓名.Text;
        String sex;
        if (选中男性按钮.Checked == true)
        {
            sex = "男";
        }
        else { sex = "女"; }
        String birthday = 出生日期.Text;
        String origion = 生源地.Text;
        String dor;
        if (住宿按钮是.Checked == true) { dor = "True"; }
        else { dor = "False"; }
        String phone = 宿舍电话.Text;
        String sql = "insert into 学生情况(学号,姓名,性别,出生日期,生源地,政治面貌,是否住宿,宿舍电话) values(\"" + num + "\",\"" + name + "\",\"" + sex + "\",\"" + birthday + "\",\"" + origion + "\",\"群众\"" + "," + dor + ",\"" + phone + "\")";
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
            Response.Write("<script>alert('添加失败,可能是学号重复，超出限度.')</script>");
            return false;
        }
    }

    protected void 删除记录_Click(object sender, EventArgs e)
    {
        String num = 学号.Text;
        String sql = "delete from 学生情况 where 学号=\"" + num + "\"";
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