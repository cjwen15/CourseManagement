<%@ Page Language="C#" AutoEventWireup="true" CodeFile="课程档案维护.aspx.cs" Inherits="课程档案维护" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>课程档案维护</title>
    <style type="text/css">
        .auto-style3 {
            width: 562px;
            height: 222px;
        }

        .auto-style5 {
            text-align: center;
        }

        .auto-style6 {
            font-size: x-large;
        }

        .auto-style8 {
            height: 511px;
        }

        .auto-style9 {
            text-align: center;
            height: 53px;
        }

        .auto-style10 {
            text-align: center;
            height: 46px;
        }

        .auto-style11 {
            height: 43px;
        }

        .auto-style12 {
            height: 48px;
        }

        .auto-style13 {
            height: 42px;
        }

        .auto-style14 {
            height: 46px;
        }

        .auto-style15 {
            height: 47px;
        }

        .auto-style16 {
            height: 58px;
        }
    </style>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <script>
        window.onload = function () {
            first()
            showPage();
        }
        function first() {//第一次加载填充文本框
            document.getElementById("课程代号").value = document.getElementById("id").value;
            document.getElementById("课程名称").value = document.getElementById("name").value;
            document.getElementById("类别").value = document.getElementById("cla").value;
            document.getElementById("考核方式").value = document.getElementById("way").value;
            document.getElementById("学分").value = document.getElementById("grade").value;
            document.getElementById("备注").value = document.getElementById("note").value;
        }
        function toPage(id) {//跳转第几页
            var nowPage = parseInt(document.getElementById(id).innerHTML);
            document.getElementById("nowPageFont").value = nowPage;
            ajaxSent(nowPage);
        }
        function showPage() {//加载5个页面号按钮
            var nowPage = parseInt(document.getElementById("nowPageFont").value);//当前页面号
            var num = parseInt(document.getElementById("pageNum").value);//总页面数
            var index;//开始按钮索引
            var nowIndex;//选中按钮索引
            var sp1 = document.getElementById("sp-1");
            var sp2 = document.getElementById("sp-2");
            var sp3 = document.getElementById("sp-3");
            var sp4 = document.getElementById("sp-4");
            var sp5 = document.getElementById("sp-5");
            sp1.parentElement.style.background = "";//全部背景设为空白
            sp2.parentElement.style.background = "";
            sp3.parentElement.style.background = "";
            sp4.parentElement.style.background = "";
            sp5.parentElement.style.background = "";
            if (nowPage <= 5) {//前五页时
                index = 1;
                nowIndex = "sp-" + (nowPage);
                sp1.innerText = index;
                sp2.innerText = index + 1;
                sp3.innerText = index + 2;
                sp4.innerText = index + 3;
                sp5.innerText = index + 4;
                document.getElementById(nowIndex).parentElement.style.background = "#33CCFF";
            } else if (nowPage >= (num - 4)) {//后五页时
                index = num - 4;
                nowIndex = "sp-" + (nowPage - num + 5);
                sp1.innerText = index;
                sp2.innerText = index + 1;
                sp3.innerText = index + 2;
                sp4.innerText = index + 3;
                sp5.innerText = index + 4;
                document.getElementById(nowIndex).parentElement.style.background = "#33CCFF";
            } else {//之间
                index = nowPage;
                nowIndex = "sp-" + 3;
                sp1.innerText = index - 2
                sp2.innerText = index - 1;
                sp3.innerText = index;
                sp4.innerText = index + 1;
                sp5.innerText = index + 2;
                document.getElementById(nowIndex).parentElement.style.background = "#33CCFF";
            }
        }
        function ajaxSent(nowPage) {
            if (window.XMLHttpRequest) {// 针对 IE7+, Firefox, Chrome, Opera, Safari 的代码
                xmlhttp = new XMLHttpRequest();
            }
            else {// 针对 IE6, IE5 的代码
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.open("GET", "课程档案维护.aspx?nowPage=" + nowPage, true);//准备
            xmlhttp.send();//发送
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {//请求已完成，且响应已就绪。OK
                    var stuString = xmlhttp.responseText;
                    var stuArray = stuString.split(",");
                    hiddenButton(stuArray);
                    fillText(stuArray);
                    showPage();
                }
            }
        }
        function nextPage() {
            var nowPage = ++document.getElementById("nowPageFont").value;
            ajaxSent(nowPage);
        }
        function lastPage() {
            var lastPage = parseInt(document.getElementById("pageNum").value);
            document.getElementById("nowPageFont").value = lastPage;
            ajaxSent(lastPage);
        }
        function fontPage() {
            var nowPage = --document.getElementById("nowPageFont").value;
            ajaxSent(nowPage);
        }
        function fontEst() {
            var nowPage = 1;
            document.getElementById("nowPageFont").value = 1;
            ajaxSent(nowPage);
        }
        function hiddenButton(stuArray) {//隐藏首页，上一页或尾页，下一页按钮
            var isLast = stuArray[6];
            var isFont = stuArray[7];
            //isLast = true;
            if (isLast == 1) {
                document.getElementById("下一页").disabled = "disabled";
                document.getElementById("尾页").disabled = "disabled";

            } else {
                document.getElementById("下一页").disabled = "";
                document.getElementById("尾页").disabled = "";
            }
            if (isFont == 1) {
                document.getElementById("上一页").disabled = "disabled";
                document.getElementById("首页").disabled = "disabled";
            } else {
                document.getElementById("上一页").disabled = "";
                document.getElementById("首页").disabled = "";
            }
        }
        function fillText(stuArray) {//填充文本框，id要改对，不让js会停止执行，填充不了。
            document.getElementById("课程代号").value = stuArray[0];
            document.getElementById("课程名称").value = stuArray[1];
            document.getElementById("类别").value = stuArray[2];
            document.getElementById("考核方式").value = stuArray[3];
            document.getElementById("学分").value = stuArray[4];
            document.getElementById("备注").value = stuArray[5];
        }
        function clean() {
            document.getElementById("课程代号").value = "";
            document.getElementById("课程名称").value = "";
            document.getElementById("学分").value = "";
            document.getElementById("备注").value = "";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" class="auto-style8">

                <asp:SiteMapPath ID="SiteMapPath1" runat="server" RenderCurrentNodeAsLink="True"></asp:SiteMapPath>


        <table align="center" border="1" class="auto-style3">
            <tbody class="auto-style5">
                <tr>
                    <td class="auto-style9" colspan="3"><strong>
                        <asp:Label ID="Label1" runat="server" BorderStyle="Groove" CssClass="auto-style6" Text="课程档案维护"></asp:Label>
                    </strong></td>
                </tr>
                <tr>
                    <td class="auto-style10">
                        <button type="button" id="添加记录" width="23px" onclick="clean()">添加记录</button>
                    </td>
                    <td class="auto-style10">
                        <asp:Button ID="删除记录" runat="server" Text="删除记录" onclick="删除记录_Click"/>
                    </td>
                    <td class="auto-style10">
                        <asp:Button ID="关闭窗体" runat="server" Text="关闭窗体" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="auto-style11">课程代号： &nbsp;
                        <asp:TextBox ID="课程代号" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="auto-style12">课程名称：&nbsp;&nbsp; 
                        <asp:TextBox ID="课程名称" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="auto-style13">类别：&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="类别" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14" colspan="3">考核方式：&nbsp;&nbsp; 
                        <asp:TextBox ID="考核方式" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15" colspan="3">学分：&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="学分" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 备注：&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="备注" runat="server"></asp:TextBox>
                        <asp:Button ID="确认添加" runat="server" Text="确认添加" OnClick="确认添加_Click" />
                        <br />
                        <br/>
                        记录：
                        <button type="button" id="首页" width="23px" onclick="fontEst()">|◀</button>
                        <button type="button" id="上一页" width="23px" onclick="fontPage()">◀</button>&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-default" onclick="toPage('sp-1')">
                            <span class="" id="sp-1">1</span>
                        </button>
                        <button type="button" class="btn btn-default" onclick="toPage('sp-2')">
                            <span class="" id="sp-2">2</span>
                        </button>
                        <button type="button" class="btn btn-default" onclick="toPage('sp-3')">

                            <span class="" id="sp-3">3</span>
                        </button>
                        <button type="button" class="btn btn-default" onclick="toPage('sp-4')">
                            <span class="" id="sp-4">4</span>
                        </button>

                        <button type="button" class="btn btn-default" onclick="toPage('sp-5')">
                            <span class="" id="sp-5">5</span>
                        </button>
                        &nbsp;&nbsp;
                        <button type="button" id="下一页" width="23px" onclick="nextPage()">▶</button>
                        <button type="button" id="尾页" width="23px" onclick="lastPage()">▶|</button>
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:HiddenField ID="nowPageFont" runat="server" Value="1" />
        <%--当前选中页 --%>
        <asp:HiddenField ID="pageNum" runat="server" />
        <%--总页数--%>
        <asp:HiddenField ID="id" runat="server" />
        <asp:HiddenField ID="name" runat="server" />
        <asp:HiddenField ID="cla" runat="server" />
        <asp:HiddenField ID="way" runat="server" />
        <asp:HiddenField ID="grade" runat="server" />
        <asp:HiddenField ID="note" runat="server" />
    </form>
</body>
</html>
