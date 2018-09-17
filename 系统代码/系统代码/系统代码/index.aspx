<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>教学管理系统</title>

    <script type="text/javascript" >
        function quit() {
            if(confirm("您确定要关闭本页吗？")){
                window.opener=null;
                window.open('','_self');
                window.close();
                }
            else{
                 }
        }
        function help() {
            alert("欢迎使用本系统！");
        }
    </script>

    <style type="text/css">
        .auto-style0 {
           background-image:url('bgp.jpg');
            width: 100%;
        }
        .auto-style1{
            border-top:10px solid #0745b4;
            background:#ffffff;
            width:25%;
            text-align:center;
            float:left;
            margin-right:5%;
            margin-left:3%;
            margin-bottom:20px;
        }
        .auto-style2 {
            border-top: 10px solid #ff6a00;
            background: #ffffff;
            width: 25%;
            text-align: center;
            margin-left: 4%;
            margin-right: 4%;
            float: left;
            margin-bottom: 20px;
        }
        .auto-style3 {
            border-top: 10px solid #0745b4;
            background: #ffffff;
            width: 25%;
            text-align: center;
            float: right;
            margin-left: 5%;
            margin-right: 3%;
            margin-bottom: 20px;
        }
        .auto-style7 {
            border-top: 10px solid #ff6a00;
            background: #ffffff;
            width: 25%;
            text-align: center;
            float: left;
            margin-right: 5%;
            margin-left: 3%;
            margin-bottom: 20px;
        }
        .auto-style8 {
            border-top: 10px solid #0745b4;
            background: #ffffff;
            width: 25%;
            text-align: center;
            margin-left: 4%;
            margin-right: 4%;
            float: left;
            margin-bottom: 20px;
        }
        .auto-style9 {
            border-top: 10px solid #ff6a00;
            background: #ffffff;
            width: 25%;
            text-align: center;
            float: right;
            margin-left: 5%;
            margin-right: 3%;
            margin-bottom: 20px;
        }

        .auto-style4 {
            margin-top: 5%;
        }
        .auto-style6 {
            margin-right: 5%;
            margin-left: 3%;
        }

        div:hover{
            box-shadow: 2px 4px 6px #000;
        }

        .auto-style10{
            position:absolute;
            font-size:large;
            font-weight:500;
            color:white;
            bottom:0;
            left:47%;
            text-align:center
        }



        </style>
</head>
<body class="auto-style0" style="height: 468px">
    <form id="form1" runat="server">
    <p class="auto-style6">
        <font color="#ffffff" size="7" >教学管理系统</font>
    </p>

        <div class="auto-style4" >


            <a class="button" href="基本表数据维护.aspx">
                <div class="auto-style1">
                    <h3>基本表数据维护</h3>    
                    <br/>
                </div>
                </a>

             <a class="button" href="简单查询.aspx">
                <div class="auto-style2">
                    <h3>简单查询</h3>
                   <br/>
                </div>
                 </a>

            <a class="button" href="统计查询.aspx">
                <div class="auto-style3">
                    <h3>统计查询</h3>
                     <br/>
                </div>
                </a>

            <a class="button" href="报表打印.aspx">
                <div class="auto-style7">
                    <h3>报表打印</h3>
                    <br/>
                </div>
                </a>

            <a class="button" href="#1" onclick="quit()">
                <div class="auto-style8">
                    <h3>关闭本系统</h3>
                    <br/>
                </div>
                </a>


            <a class="button" href="#2" onclick="help()">
                <div class="auto-style9">
                    <h3>帮助</h3>
                    <br/>
                </div>
                </a>

            
            </div>

        
    </form>


            
        <p class="auto-style10">
        <asp:Label ID="Label1" runat="server" Text="第12组作品" ></asp:Label>
        </p>




</body>
</html>
