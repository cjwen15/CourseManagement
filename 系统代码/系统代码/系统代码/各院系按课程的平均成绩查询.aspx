<%@ Page Language="C#" AutoEventWireup="true" CodeFile="各院系按课程的平均成绩查询.aspx.cs" Inherits="各院系按课程的平均成绩查询" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>各院系按课程的平均成绩查询</title>
    <style type="text/css">
        .auto-style1 {
            width: 41%;
            height: 277px;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            text-align: left;
            width: 886px;
        }
    </style>

    <script>
        window.onload = function () {
            showPage();
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
                index = nowPage ;
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
            xmlhttp.open("GET", "各院系按课程的平均成绩查询.aspx?nowPage=" + nowPage, true);//准备
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
            var isLast = stuArray[8];
            var isFont = stuArray[9];
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
            document.getElementById("院系名称").value = stuArray[0];
            document.getElementById("课程名称").value = stuArray[1];
            document.getElementById("平均成绩").value = stuArray[2];



        }
    </script>

</head>
<body>
    <form id="form1" runat="server">

                <asp:SiteMapPath ID="SiteMapPath1" runat="server" RenderCurrentNodeAsLink="True"></asp:SiteMapPath>

     
        <table align="center" border="1" class="auto-style1" >
            <tr class="auto-style2">
                <td class="auto-style3" style="color: #0000FF;">
                    院系名称：&nbsp;
                    <asp:TextBox ID="院系名称" runat="server" BackColor="#CCCCCC"></asp:TextBox>
                    <br />
                    <br />
                    课程名称：&nbsp;
                    <asp:TextBox ID="课程名称" runat="server" BackColor="#CCCCCC"></asp:TextBox>
                    <br />
                    <br />
                    平均成绩：&nbsp; <asp:TextBox ID="平均成绩" runat="server" BackColor="#CCCCCC"></asp:TextBox>
                    <br />
                    <br />
                    <%--翻页的button用html button,不能用asp button.--%>
                    记录：<button type="button" id="首页"   width="23px"  onclick="fontEst()" >|◀</button>
                    &nbsp;<button type="button" id="上一页"   width="23px" onclick="fontPage()" >◀</button>&nbsp;
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
                    &nbsp;<button type="button" id="下一页" width="23px" onclick="nextPage()" >▶</button>
                    &nbsp;<button type="button" id="尾页"   width="23px" onclick="lastPage()" >▶|</button>
                    <br />
&nbsp;</td>
            </tr>
        </table>
        <asp:HiddenField ID="nowPageFont" runat="server" Value="1" />
        <%--当前选中页 --%>
        <asp:HiddenField ID="pageNum" runat="server" />
        <%--总页数--%>
    </form>
</body>
</html>
