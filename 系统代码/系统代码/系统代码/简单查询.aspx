<%@ Page Language="C#" AutoEventWireup="true" CodeFile="简单查询.aspx.cs" Inherits="简单查询" Debug="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>简单查询</title>
    <style type="text/css">
        .auto-style3 {
            margin-top: 10%;
            width: 562px;
            height: 329px;
            margin-left: 26%;
        }

        .auto-style5 {
            text-align: center;
        }

        .auto-style6 {
            font-size: x-large;
        }

        .auto-style7 {
            height: 24px;
            text-align: center;
        }

        .auto-style8 {
            text-align: center;
            height: 71px;
        }

        .auto-style0 {
            background-image: url('bgk.jpg');
            background-size: cover;
        }
    </style>


    <script>
        function startTimer() {
            var time = new Date();  //获取客户端当前系统日期
            var h = time.getHours();
            var m = time.getMinutes();
            var s = time.getSeconds();
            //m = checkTime(m);  //调用自定义的checkTime()函数，在小于10的数字前加0
            //s = checkTime(s);
            document.getElementById("time").innerHTML = h + ":" + m + ":" + s;  //设置divTimer层显示内容
            setTimeout("startTimer()", 1000);  //过1秒后重复调用自定义的startTimer()函数


            var d = time.getDate();
            var m = time.getMonth() + 1;
            var y = time.getFullYear();
            //m = checkTime(m);  //调用自定义的checkTime()函数，在小于10的数字前加0
            //s = checkTime(s);
            document.getElementById("day").innerHTML = y + "-" + m + "-" + d;  //设置divTimer层显示内容
        }
    </script>




</head>
<body onload="startTimer()" class="auto-style0">
    <form id="form1" runat="server">


        <asp:SiteMapPath ID="SiteMapPath1" runat="server" RenderCurrentNodeAsLink="True"></asp:SiteMapPath>

        <table align="center" border="1" class="auto-style3">

            <tbody class="auto-style5">
                <tr>
                    <td class="auto-style8" colspan="3"><strong>
                        <asp:Label ID="Label1" runat="server" BorderStyle="None" CssClass="auto-style6" Text="简单查询"></asp:Label>
                    </strong></td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="Label2" runat="server" Text="当前日期"></asp:Label>
                        <div id="day"></div>


                    </td>
                    <td class="auto-style7">
                        <asp:Label ID="Label3" runat="server" Text="当前时间"></asp:Label>
                        <div id="time"></div>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style7">
                        <asp:Button ID="学生情况查询" runat="server" Text="学生情况查询" PostBackUrl="~/学生情况.aspx" />
                        <br />
                    </td>
                    <td class="auto-style7">
                        <asp:Button ID="课程档案查询" runat="server" Text="课程档案查询" PostBackUrl="~/课程档案.aspx" />
                        <br />
                    </td>
                </tr>

                <tr>
                    <td class="auto-style7">
                        <asp:Button ID="选课及成绩查询" runat="server" Text="选课及成绩查询" PostBackUrl="~/选课及成绩.aspx" />
                        <br />
                    </td>
                    <td class="auto-style7">
                        <asp:Button ID="教师情况查询" runat="server" Text="教师情况查询" PostBackUrl="~/教师情况.aspx" />
                        <br />
                    </td>
                </tr>

                <tr>
                    <td class="auto-style7">
                        <asp:Button ID="返回主页" runat="server" Text="返回主页" PostBackUrl="~/index.aspx" />
                        <br />
                    </td>
                </tr>

            </tbody>
        </table>

    </form>
</body>
</html>
