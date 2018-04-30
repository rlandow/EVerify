<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PRPFTest.aspx.cs" Inherits="EVerify.PRPFTest" %>

<!DOCTYPE html>
<style type="text/css">
    body {
        font-family:Arial;
    }

</style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="scripts/jquery-3.1.1.slim.js"></script>
    <script src="scripts/jquery-3.1.1.js"></script>
    <style type="text/css">
        .popup_msg{
          position:absolute;
          z-index:999;   
          width:172px;
          height:20px;
          text-align:center;
          color:#FF0000;
          font: 12px Verdana, Arial, Helvetica, sans-serif;
          border:1px solid red;
         display:none;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            function btnBack() {
                alert('foo')
                this.blur();
            }

                function popup(e) {
                console.log(e)
                //getting height and width of the message box
                var height = $('#popuup_div').height();
                var width = $('#popuup_div').width();
                //calculating offset for displaying popup message
                leftVal = e.pageX + "px";
                topVal = e.pageY + "px";
                //alert(e.page .pageX)
                //alert(e.pageY)
                //alert(leftVal)
                //alert(top)
                //show the popup message and hide with fading effect
                $('#popuup_div').css({ left: leftVal, top: topVal }).show();
            };


            /*$("body").on("click", ("input[type=text]"), popup)*/
        })


        /*$(document).click(function (e) {
            //getting height and width of the message box
            var height = $('#popuup_div').height();
            var width = $('#popuup_div').width();
            //calculating offset for displaying popup message
            leftVal = e.pageX - (width / 2) + "px";
            topVal = e.pageY - (height / 2) + "px";
            //show the popup message and hide with fading effect
            $('#popuup_div').css({ left: leftVal, top: topVal }).show().fadeOut(1500);
        });*/


    </script>
</head>
<body>
    
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server"></asp:ScriptManager>
    <div>
        <asp:TextBox ID="txtLoignName" Text="rlandow" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />

    </div>
    <div id="popuup_div" class="popup_msg">
        
        Cannot change this
    </div> 

    </form>
</body>
</html>
