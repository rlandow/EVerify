<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="second.aspx.cs" Inherits="EVerify.second" %>

<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1"] >
<html xmlns="http://www.w3.org/1999/xhtml"
    >
<head runat="server">
    <title></title>

    <script src="/scripts/jquery-1.12.4.js"></script>
    <script src="/Scripts/jqueryUI/jquery-ui.js"></script>
    <link href="/Scripts/jqueryUI/jquery-ui.css" rel="stylesheet" />
    <link href="/jQueryUI/Smoothness/jquery-ui.theme.css" rel="stylesheet" />
    <link href="/css/Datepicker.css" rel="stylesheet" />
    
    <style type="text/css">

        .backgroundRed {
            background-color: lightsalmon;
        }

        .backgroundGreen {
            background-color: lightsalmon;
        }

        .backgroundGray {
            background-color: lightgray;
        }

        .readonly {
            background-color: lightgray
        }

        .readwrite { 
            background-color: #b0e0e6
        }

        #contentWrapper {
            display:flex; 
            flex-direction:column;
            left:0;
            position:absolute; 
            top:70px; 
            width:90%
        }

        .header-container {
            background:#FFFACD;
            border:1px solid #666;
            display:flex;
            height:50px;
            justify-content:space-around;
            left:0;
            opacity:97;
            position:fixed;
            top:0;
            width:100%;
        }

        .button {
            /*background-color:#121780;*/
            background-color:#A7CBEF;
            color:darkblue;
        }

        .buttongreen {
            /*background-color:#121780;*/
            background-color:lightgreen;
            color:darkblue;
        }

        .review {
            display:flex;
            flex-direction:column;
            justify-content:space-between;
            align-items:flex-start;
            width:90%;
            margin:0 auto;
            font-family:Calibri, Arial;
        }
    
        .docAB {
            display:flex; flex-direction:column

        }

        #or1 {display:none}

        #or2 {display:none}

        #or3 {display:inherit}

        .review > div {
            font-family:Calibri,  Arial;
        }

        .listA {
            display:flex;
            flex-direction:column;
            
        }

        .listAitem {
            border-left:1px solid black;
            border-right:1px solid black;
            border-bottom:1px solid black;
            padding-left:8px;
			padding-bottom:4px;

        }

        .listA > div:first-of-type { 
           border-top:1px solid black;
        }

        .finalContainer {
            display:flex; 
            flex-direction:column; 
            margin: 0 5px;
        }
        
        .certification {
            display:flex;
            flex-direction:column;
            overflow:auto;
            font-family:Calibri;

        }        

        .attestation {
            border:1px solid black;
            display:flex;
            flex-direction:column;
            overflow:auto;
            width:90%;
            margin:0 auto;
        }

        .attestation > div {
            font-family:Calibri;
        }

        .row {
            display:flex;
            flex-direction:column;
            margin:0 auto 10px auto;

            width:70%;
        }

        .row input[type:] {
            display:flex;
            flex-direction:column;
            margin:0 auto;
            background-color:gray;
            width:60%;
        }

        .sectionHeader {
            border:1px solid black;
            background-color:lightgray;
            font-family:Calibri
        }

        .innerWrapper {
            display:flex; 
            flex-direction:column;
            justify-content:space-between;
        }

        .innerWrapperFoo {
            display:flex; 
            flex-direction:column;
            justify-content:space-between;
        }

        .finalContainer input[type=text]  {
            width:150px
        }

        .popup_msg {
            position: absolute;
            z-index: 10;
            width: 132px;
            height: 20px;
            text-align: center;
            color: #FF0000;
            font: 12px Verdana, Arial, Helvetica, sans-serif;
            background-color:pink;
            border:1px solid red;
            display: none;
        }
        
        .ui-datepicker-days-cell-over {
            background-color: #B6B6B4;

        }

        .ui-datepicker-calendar{
            margin:0 auto
        }

        .ui-state-active {
            background-color: yellow;
        }

        .ui-datepicker-current-day {
            background-color:yellow ;
        }

        .ui-datepicker tr td:hover{
            background-color: #A9A9A9
        }


        .ui-datepicker-days-cell-over.ui-datepicker-today {
                background-color:yellow;
        }

        @media all and (min-width: 990px) {
            
            #contentWrapper {
                width:100%
            }

            .docAB {
                flex-direction:row
            }

            #or1 {display:inherit}
    
            #or2 {display:inherit}
    
            #or3 {display:none}

            .review {
                flex-direction: row;
            }

            .attestation {
                justify-content:space-between; width:80%;
				width:90%;				
                margin:0 auto
            }
            
            .row{width:100%}

            .row {
                flex-direction: row;
                margin:0;
            }

            .listC {
                margin-right:10px
            }
  
            .innerWrapper {
                display:flex; 
                flex-direction:row;
                justify-content:space-between;
            }
    
            .innerWrapperFoo {
                display:flex; 
                flex-direction:row;
                justify-content:space-between;
            }

            .finalContainer input[type=text]  {
                width:100%
    
            }

            .col80 {
                flex:0 1 80%;
                border-right:1px solid black;
            }

            .col70 {
                flex:0 1 70%;
                border-right:1px solid black;
            }

            .col60 {
                flex:0 1 60%;
                border-right:1px solid black;
                
            }

            .col50 {
                flex:0 1 50%;
                border-right:1px solid black;
                
            }

            .col40 {
                flex:0 1 40%;
                border-right:1px solid black;
            }

            .col30 {
                flex:0 1 30%;
                border-right:1px solid black;
            }

            .col20 {
                flex:0 1 20%;
                border-right:1px solid black;
            }

            .col10 {
                flex:0 1 10%;
                border-right:1px solid black;
            }

        }


        /* No greater than 900px, no less than 400px */
         /*   @media (max-width:900px) and (min-width:700px) {
            .foo {
                display:none;
            }
        }​*/

        @media all and (max-width: 1140px) and  (min-width: 740px) {
            .innerWrapperFoo {
                display:flex; 
                flex-direction:column;
                justify-content:space-between;
            }

            .innerWrapperFoo input[type=text] {
                width:350px
            }
        }

    </style>

    <script type="text/javascript">
        $( document ).ready(function() {
            
            $(".datepicker").css("background-color", "#b0e0e6")

            //$('.datepicker').focus(function () {
            //    $(this).css({ 'background': 'white' });
            //});

            //$(".listA div:nth-child(n+6) input").css("background-color", "green")

            //$("input[type=text]").css("background-color", "#b0e0e6")


            //$('input:text').focus(function () {
            //    $(this).css({ 'background': 'white' });
            //});
            //
            //$('input:text').blur(function () {
            //    $(this).css({ 'background': '#b0e0e6'});
            //});

            $(".readonly").focus(function () {
                $(this).blur();
            });

            $(".readonly").click(function popup(e) {
                //getting height and width of the message box
                var height = $('#popuup_div').height();
                var width = $('#popuup_div').width();
                //calculating offset for displaying popup message
                leftVal = e.pageX - (width / 2) + 50 + "px";
                topVal = e.pageY - (height / 2) + 20 + "px";
                //show the popup message and hide with fading effect
                $('#popuup_div').css({ left: leftVal, top: topVal }).show().fadeOut(1200);
            })

            $('.readwrite').focus(function () {
                $(this).css({ 'background': 'white' });
            });

            $('.readwrite').blur(function () {
                $(this).css({ 'background': '#b0e0e6' });
            });

            function pickDate() {
                $(".datepicker").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    showOtherMonths: true,
                    dayNamesMin: ['Su', 'Mo', 'Tu', 'We', 'Thu', 'Fr', 'Sa']
                });

                /*$(".datepicker").blur();*/
            };

            $("body").on("focus", (".datepicker"), pickDate)

            /*$("body").on("focus", (".datepicker"), pickDate)

            $(".listA div:nth-child(n+6) input").css("background-color", "lightgray")
            
            $(".listA div:nth-child(n+6) select").css("background-color", "lightgray")

            $(".listA div:nth-child(n+6) input").attr("disabled", true)
            $(".listA div:nth-child(n+6) select").attr("disabled", true)*/
            
            /*$(".listA .listAitem select").css("background-color", "lightblue")

            $(".listA .listAitem select").on("focus", (function (e) { $(this).css("background", "white") }))
            $(".listA .listAitem select").on("blur", (function (e) { $(this).css("background", "lightblue") }))*/

            //$("select").css("background-color", "lightblue")

            $("select").on("focus", (function (e) { $(this).css("background", "white") }))
            $("select").on("mousedown", (function (e) { $(this).css("background", "white") }))
            $("select").on("blur", (function (e) { $(this).css("background", "lightblue") }))

            console.log($("select"))

            function checkdate(input) {
                var validformat = /^\d{2}\/\d{2}\/\d{4}$/ //Basic check for format validity
                var returnval = false

                if ($(input).val() == "") return true
                if (!validformat.test($(input).val())) returnval = false
                    //showDialog("Invalid date", $(input).val() + " is not a valid date")
                    //alert("Invalid Date Format. Please correct and submit again.")
                else { //Detailed check for valid date ranges
                    var monthfield = input.value.split("/")[0]
                    var dayfield = input.value.split("/")[1]
                    var yearfield = input.value.split("/")[2]
                    var dayobj = new Date(yearfield, monthfield - 1, dayfield)
                    if ((dayobj.getMonth() + 1 != monthfield) || (dayobj.getDate() != dayfield) || (dayobj.getFullYear() != yearfield))
                        returnval = false
                        //showDialog("Invalid date", $(input).val() + " is not a valid date")
                        //alert("Invalid Day, Month, or Year range detected. Please correct and submit again.")}
                    else returnval = true
                }
                //if (returnval==false)  { 
                //    //$(input).focus() 
                //    event.stopPropagation()
                //}
                //input.select()
                return returnval
            }

            
            $("body").on("blur", (".datepicker"), function () {
                if (!checkdate(this)) {
                    var target = event.target
                    showDialog("Invalid date", $(this).val() + " is not a valid date.", target)
                    $(this).val("")
                }

            }); // End of blur

        }) //End of ready function

        function showCheckSignature(e) {
            this.blur()
            

            //var itemname = $(e).prop("id") 
            var signed = true;    
            var message
            targetItem = event.target

            switch ($(targetItem).prop("id")) {
                case "chkSignature":
                    if ($('#<%=txtCertifySignature.ClientID%>').val() == "") {
                        signed = false
                        message = "You have not made an entry for Signature of Employer"
                        $("#<%=chkSignature.ClientID%>").prop("checked", false)
                    }
                    break;
                case "chkSignatureReverify":
                    if ($('#<%=txtReverifySignature.ClientID%>').val() == "") {
                        signed = false
                        message = "You have not made an entry for Signature of Employer (Reverify)"
                        $("#<%=chkSignatureReverify.ClientID%>").prop("checked", false)
                    }
                    break;
            }

            if (signed == false) {
                showDialog('No signature', message)
                return
            }

            showConfirm("Certify Signature", "I hereby confirm that my name entered on this Form I-9 is my signature.")

            switch ($(targetItem).prop("id")) {
                case "chkSignature":
                    var element = $("#<%=txtCertifyCertifySignatureDateH.ClientID%>")
                    break
                case "chkSignatureReverify":
                    var element = $("#<%=txtReverifySignatureCertifyDateH.ClientID%>")
                    break
            }
            $(element).val(Date.now)
        }
        
        function showConfirm(foo) {
            var foo2 = event.target
            var foo3 = $(foo2).parent().parent().parent().parent()
            
            $("#confirm").dialog({
                modal: true,
                autoOpen: true,
                title: foo,
                width: 300,
                height: 225,
                open: function (event, ui) {
                    var widget = $(this).dialog("widget");
                    $(".ui-dialog-titlebar-close span", widget)
                        .removeClass("ui-icon-closethick")
                        .addClass("ui-icon-closethick");
                    $(this).text("I hereby confirm that my name entered on this Form I-9 is my signature.")
                    $(".ui-dialog-title").text(foo)

                    $(".ui-dialog-buttonset .ui-button:nth-of-type(1)").css("background-color", "lightgreen")
                    $(".ui-dialog-buttonset .ui-button:nth-of-type(1)").css("background-image", "none")

                    $(".ui-dialog-buttonset .ui-button:nth-of-type(2)").css("background-color", "lightsalmon")
                    $(".ui-dialog-buttonset .ui-button:nth-of-type(2)").css("background-image", "none")

                },
                buttons: {
                    "Yes": function () {
                        $(foo2).prop('checked', true)
                        //$("#I9_chkSignature").prop('checked', true)
                        $(this).dialog('close');
                        //$(".SigCertifyEmp").css("background-color", "lightgreen")
                        $(foo3).css("background-color", "lightgreen")
                        
                        //var objWin = window.self;
                        //objWin.open('', '_self', '');
                        //objWin.close();
                    },
                    "No": function () {
                        $(this).dialog('close');
                        $(foo2).prop('checked', false)
                        //$("#I9_chkSignature").prop('checked', false)
                        //$(".SigCertifyEmp").css("background-color", "lightsalmon")
                        $(foo3).css("background-color", "lightsalmon")
                    }
                }
            });

        }

        function showDialog(title, text, target) {
            $("#dialog").dialog({
                title: title,
                modal: true,
                buttons: {
                    OK: function () {
                        $(event.target).focus()
                        $(this).dialog("close"); //closing on Ok click
                        //$("#I9_chkSignature").prop('checked', false)
                        $(".header-container input[type=submit]").prop("disabled", false)
                        $(target).focus()
                    }
                },

                open: function (event, ui) {
                    $(this).text(text)
                }
            });

        }

        function saveSuccessful(){
            messagetext = ""
            if ($("#<%=chkSignature.ClientID%>").prop('checked')) {
                
                messagetext = messagetext + "Employer Attestation Signature certified"
                $("#dialog").css("background-color", "lightgreen")
            }
            else {
                $("#dialog").css("white-space", "pre-wrap");
                messagetext = messagetext + "Employer Attestation Signature not certified"
                $("#dialog").css("background-color", "lightsalmon")
            }
            $(".header-container input[type=submit]").prop("disabled", true)
            showDialog("Form I-9 - Saved", messagetext) 
            
            //alert('sent by C#')
        }

        function DocATitleChange() {

            //var foo = event.target
            //
            //if ($(foo).val() == "29") {
            //    $("#ddlDocA1Issuer").attr("disabled", "disable");
            //    $("#ddlDocA1Issuer").val("")
            //}
            //else {
            //    $("#ddlDocA1Issuer").removeAttr("disabled")
            //}
        }

    </script>


</head>
<body>
    <form id="form1" runat="server">
    <div id="contentWrapper">
     <hr color="black" size="2"> 
        <hr />

    <div class="review" style="border:1px solid black;display:flex;flex-direction:row">    
            <div style="background-color:lightgray">
                <B>Section 2. Employer or Authorized Representative Review and Verification</B><br />
                <em>(Employers or their authorized representative must complete and sign Section 2 within 3 business days of the employee's first day of employment. You
                  must physically examine one document from List A OR a combination of one document from List B and one document from List C as listed on
                the "Lists of Acceptable Documents.")</em>
        </div>
    </div>
    <br />

    <div class="attestation">
        <div class="row">
            <div class="col20" style="display:flex;flex-direction:column; justify-content:center">
                <div >
                    <B>Employee Info from Section 1</B>
                </div>
            </div>
            <div class="col20">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>Last Name <em>(Family Name)</em></div>
                        <div><asp:Label ID="lblLastName" runat="server" Text=""></asp:Label></div>
                    </div>
                </div>
            </div>
            <div class="col20">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>First Name <em>(Given Name)</em></div>
                        <div><asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label></div>
                    </div>
                </div>
            </div>
            <div class="col10">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>M.I.</div>
                        <div><asp:Label ID="lblMiddle" runat="server" Text=""></asp:Label></div>
                    </div>
                </div>
            </div>
            <div>
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>Citizenship/Imigration Status</div>
                        <div><asp:Label ID="lblCit" runat="server" Text=""></asp:Label></div>
                    </div>
                </div>
            </div>
        </div> <!--End row -->
    </div>



    <br />
    <div class="review" style="border:1px solid black">
        <div id="divListA" class="listA" runat="server"><b>List A
            <br />
            Identity and Employment Authorization</b>
            
            <div class="listAitem">Document Title:<br />
                <asp:DropDownList ID="ddlDocA1Title" runat="server" Width="225px" onchange="DocATitleChange()">
                    <asp:ListItem Value="">None</asp:ListItem>
                    <asp:ListItem Value="11">Arrival/Departure Record (Form I-94)</asp:ListItem>
                    <asp:ListItem Value="13">Permanent Resident Card or Alien Registration Receipt</asp:ListItem>
                    <asp:ListItem Value="17">Employment Authorization Document</asp:ListItem>
                    <asp:ListItem Value="24">Foreign Passport with I-94</asp:ListItem>
                    <asp:ListItem Value="25">Foreign Passport with I-551</asp:ListItem>
                    <asp:ListItem Value="29">U.S. Passport or Passport Card</asp:ListItem>
                </asp:DropDownList>
            </div>              
            <div class="listAitem">Issuing Autority:<br />
                <asp:DropDownList ID="ddlDocA1Issuer" runat="server">
                </asp:DropDownList>
            </div>              
            <div class="listAitem">Document Number:<br />
                <asp:TextBox ID="txtDocA1Number" runat="server"></asp:TextBox>
            </div>              
            <div class="listAitem" style="border-bottom:2px solid black">Expiration Date <em>(if any) (mm/dd/yyy)</em><br />
                <asp:TextBox ID="txtDocA1Date" runat="server"></asp:TextBox>
            </div>                                      
            <div class="listAitem">Document Title:<br />
                <asp:DropDownList ID="ddlDocA2Title" runat="server" Width="225px">
                    <asp:ListItem Value="">None</asp:ListItem>
                    <asp:ListItem Value="11">Arrival/Departure Record (Form I-94)</asp:ListItem>
                    <asp:ListItem Value="13">Permanent Resident Card or Alien Registration Receipt</asp:ListItem>
                    <asp:ListItem Value="17">Employment Authorization Document</asp:ListItem>
                    <asp:ListItem Value="24">Foreign Passport with I-94</asp:ListItem>
                    <asp:ListItem Value="25">Foreign Passport with I-551</asp:ListItem>
                    <asp:ListItem Value="29">U.S. Passport or Passport Card</asp:ListItem>
                </asp:DropDownList>

            </div>              
            <div class="listAitem">Issuing Autority:<br />
                <asp:DropDownList ID="ddlDocA2Issuer" runat="server">
                </asp:DropDownList>
            </div>              
            <div class="listAitem">Document Number:<br />
                <asp:TextBox ID="txtDocA2Number" runat="server"></asp:TextBox>
            </div>              
            <div class="listAitem" style="border-bottom:2px solid black">Expiration Date <em>(if any) (mm/dd/yyy)</em>asdf<br />
                <asp:TextBox ID="txtDocA2Date" class="datepicker" runat="server"></asp:TextBox>
            </div>                                      
            <div class="listAitem">Document Title:<br />
                <asp:DropDownList ID="ddlDocA3Title" runat="server" Width="225px">
                    <asp:ListItem Value="">None</asp:ListItem>
                    <asp:ListItem Value="11">Arrival/Departure Record (Form I-94)</asp:ListItem>
                    <asp:ListItem Value="13">Permanent Resident Card or Alien Registration Receipt</asp:ListItem>
                    <asp:ListItem Value="17">Employment Authorization Document</asp:ListItem>
                    <asp:ListItem Value="24">Foreign Passport with I-94</asp:ListItem>
                    <asp:ListItem Value="25">Foreign Passport with I-551</asp:ListItem>
                    <asp:ListItem Value="29">U.S. Passport or Passport Card</asp:ListItem>
                </asp:DropDownList>
            </div>              
            <div class="listAitem">Issuing Autority:<br />
                <asp:DropDownList ID="ddlDocA3Issuer" runat="server">
                </asp:DropDownList>
            </div>              
            <div class="listAitem">Document Number:<br />
                <asp:TextBox ID="txtDocA3Number" runat="server"></asp:TextBox>
            </div>              
            <div class="listAitem" style="border-bottom:2px solid black">Expiration Date <em>(if any) (mm/dd/yyy)</em><br />
                <asp:TextBox ID="txtDocA3Date" class="datepicker" runat="server"></asp:TextBox>
            </div>                                      
            
        </div>
        <div class="list" style="background-color:gray">
            <div id="or1" style="background-color:white"><b>OR</b></div>
            <div id="or2" style="background-color:white">&nbsp;</div>
            <div style="background-color:gray">&nbsp;</div>
            <div id="or3" style="background-color:white"><b>OR</b></div>
        </div>  
        <div id="divDocAB" style="display:flex; flex-direction:column; margin-right:120px" runat="server">
            <div class="docAB" >
                <div class="list">List B
                    <br />
                    <b>Identity</b>
                    <div class="listAitem" style="border-top:1px solid black;">Document Title:<br />
                        <asp:DropDownList ID="ddlDocBTitle" runat="server">
                            <asp:ListItem Value="">None</asp:ListItem>
                            <asp:ListItem Value="1">Driver's license</asp:ListItem>
                            <asp:ListItem Value="2">ID Card</asp:ListItem>
                            <asp:ListItem Value="3">School ID card</asp:ListItem>
                            <asp:ListItem Value="4">Voter registration card</asp:ListItem>
                            <asp:ListItem Value="5">U.S. military card</asp:ListItem>
                            <asp:ListItem Value="6">Military dependent's ID card</asp:ListItem>
                            <asp:ListItem Value="7">U.S. Coast Guard Merchant Mariner Card</asp:ListItem>
                            <asp:ListItem Value="8">Native American tribal document</asp:ListItem>
                            <asp:ListItem Value="9">Canadian Driver's license</asp:ListItem>
                            <asp:ListItem Value="10">School record or report card</asp:ListItem>
                            <asp:ListItem Value="11">Doctor or hospital record</asp:ListItem>
                            <asp:ListItem Value="12">Day-care or nursery school record</asp:ListItem>
                        </asp:DropDownList>
                    </div>              
                    <div class="listAitem">Issuing Autority:<br />
                        <asp:DropDownList ID="ddlDocBIssuer" runat="server"></asp:DropDownList>
                    </div>              
                    <div class="listAitem">Document Number:<br />
                        <asp:TextBox ID="txtDocBNumber" runat="server"></asp:TextBox>
                    </div>              
                    <div class="listAitem" style="border-bottom:2px solid black">Expiration Date <em>(if any) (mm/dd/yyy)</em><br />
                        <asp:TextBox ID="txtDocBDate" runat="server" class="datepicker"></asp:TextBox>
                    </div>                                      

                </div>
                <b>AND</b>
                <div class="listC" >List C
                    <br />
                    <B>Employment Autorization</B>
                    <div class="listAitem" style="  border-top:1px solid black;">Document Title:<br />
                        <asp:DropDownList ID="ddlDocCTitle" runat="server" Width="250px">
                            <asp:ListItem Value="">None</asp:ListItem>
                            <asp:ListItem Value="13">Social Security Card</asp:ListItem>
                            <asp:ListItem Value="14">Certification of Birth Abroad (Form FS-545)</asp:ListItem>
                            <asp:ListItem Value="15">Certification of Report of Birth (Form DS-1350)</asp:ListItem>
                            <asp:ListItem Value="16">U.S. birth certificate (original or certified copy)</asp:ListItem>
                            <asp:ListItem Value="17">Native American tribal document</asp:ListItem>
                            <asp:ListItem Value="18">U.S. Citizen ID Card (Form I-197)</asp:ListItem>
                            <asp:ListItem Value="19">ID Card for Use of Resident Citizen in the United States (Form I-179)</asp:ListItem>
                            <asp:ListItem Value="20">Employment authorization document issued by the U.S. Department of Homeland Security</asp:ListItem>
                        </asp:DropDownList>
                    </div>              
                    <div class="listAitem">Issuing Autority:<br />
                        <asp:DropDownList ID="ddlDocCIssuer" runat="server"></asp:DropDownList>
                    </div>              
                    <div class="listAitem">Document Number:<br />
                        <asp:TextBox ID="txtDocCNumber" runat="server"></asp:TextBox>
                    </div>              
                    <div class="listAitem" style="border-bottom:2px solid black">Expiration Date <em>(if any) (mm/dd/yyy)</em><br />
                        <asp:TextBox ID="txtDocCDate" runat="server" class="datepicker"></asp:TextBox>
                    </div>                                      
                </div>
            </div>
            <div>
                <br />
                <B>Additional Information</B>
                <div  style="  ">
                    <asp:TextBox ID="txtDocsAdditional" TextMode="MultiLine" Rows="3" Width="250px" runat="server"></asp:TextBox>
                </div>              
            </div>
        </div>
    </div>
    <br />
    <div class="review" style="display:flex;flex-direction:row"">
        <div>
            <b>Certification: I attest, under penalty of perjury, that (1) I have examined the document(s) presented by the above-named employee,
            (2) the above-listed document(s) appear to be genuine and to relate to the employee named, and (3) to the best of my knowledge the
            employee is authorized to work in the United States.
            <br /><br />
            The employee's first day of employment (mm/dd/yyyy): <asp:TextBox ID="txtFirstWorkDate" runat="server" class="datepicker"></asp:TextBox><em> (See instructions for exemptions.)</em></b>
        </div>
    </div>
    <br />
    <div id="divCertify" class="attestation" runat="server">
        <div class="row">
            <div class="col40">
                <div class="innerWrapper">          
                    <div class="finalContainer">      
                        <div>
                            &nbsp;Signature of Employer:    &nbsp;</div>
                        <div>
                            <asp:TextBox ID="txtCertifySignature" runat="server"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div id="divSignatureCertified" runat="server" class="col10" style="flex-direction:column; justify-content:center;">
                <div class="innerWrapperFoo" style="flex-direction:column; justify-content:space-around">
                    <div class="finalContainer" style="flex-direction:column; justify-content:space-around">
                        <div>
                            Signature Certified: 
                        </div>
                        <div style="margin:0 auto; width:25%">
                            <asp:CheckBox ID="chkSignature" onclick ="showCheckSignature(this)" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col20">
                <div class="innerWrapperFoo">
                    <div class="finalContainer">
                        <div>
                            &nbsp;Today's Date <em>(mm/dd/yyyy): </em>
                        </div>
                        <div>
                            <span style="display: inline-block;margin-top:5px"><asp:TextBox ID="txtCertifyDate" Width="100px" class="datepicker" runat="server"></asp:TextBox></span>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="innerWrapper">                
                    <div class="finalContainer">
                        <div>
                            &nbsp;Title of Employer or Authorized Representative: 
                        </div>
                        <div>
                            <span style="display: inline-block;margin-top:5px;margin-bottom:3px"><asp:TextBox ID="txtCertifyTitle" runat="server"></asp:TextBox></span>
                        </div>
                    </div>
                </div>
            </div>

        </div> <!--End row -->

        <div style="border-top:1px solid black"></div>
        <div class="row">
            <div class="col40">
                <div class="innerWrapperFoo">
                        <div class="finalContainer">
                            <div class="final">Last Name of Employer or Authorized Representative</div>
                            <div class="final"><asp:TextBox ID="txtCertifyLastName" runat="server"></asp:TextBox></div>
                        </div>
                </div> <!--InnerWrapper-->
            </div> <!--End col60 -->
            <div class="col40">
                <div class="innerWrapperFoo">
                        <div class="finalContainer" >
                            <div >First Name of Employer or Authorized Representative</div>
                            <div ><asp:TextBox ID="txtCertifyFirstName" Width="150px" runat="server"></asp:TextBox></div>
                        </div>
                </div>
            </div>
            <div>
                <div class="finalContainer" >
                    <div>Employer's Business or Organization Name</div>
                    <div><asp:Label ID="lblCertifyCompanyName" runat="server" Text="Waffle House"></asp:Label></div>
                </div>
            </div>
        </div> <!--End row -->
        
        <div style="border-top:1px solid black"></div>
        <div class="row">
            <div class="col50">
                <div class="innerWrapperFoo">
                    <div class="finalContainer" >
                        <div>Employer's Business or Organization Address (Street Number and Name): </div>
                        <div><asp:Label ID="lblCertifyAddress" runat="server" Text="5986 Financial Drive"></asp:Label></div>
                    </div>
                </div>
            </div>
            <div class="col30">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>City or Town</div>
                        <div><asp:Label ID="lblCertifyCity" runat="server" Text="Norcorss"></asp:Label></div>
                    </div>
                </div>
            </div>
            <div class="col10">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>State</div>
                        <div><asp:Label ID="lblCertifyState" runat="server" Text="GA"></asp:Label></div>
                    </div>
                </div>
            </div>
            <div>
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>ZIP Code</div>
                        <div><asp:Label ID="lblCertifyZip" runat="server" Text="30071"></asp:Label></div>
                    </div>
                </div>
            </div>
        </div> <!--End row -->

    
    </div> <!--End Attestation -->
    <br />
    <div id="divReverifyName" class="attestation" runat="server">
        <div class="sectionHeader">
            <b>Section 3. Reverification and Rehires </b> <em>(To be completed and signed by employer or authorized representative.)</em>
        </div> <!-- End sectionheader -->
        <div class="sectionHeader">
            A. New Name<em>(if applicable)</em>
        </div> <!-- End sectionheader -->
        <div class="row">
            <div class="col30">
                <div class="innerWrapperFoo">
                    <div class="finalContainer">
                        <div class="final">Last Name (<em>Family Name</em>)</div>
                        <div class="final"><asp:TextBox ID="txtReverifyLastName" runat="server"></asp:TextBox></div>
                    </div>
                </div>
            </div> <!--End col30 -->    
            <div class="col30">
                <div class="innerWrapperFoo">
                    <div class="finalContainer" >
                        <div class="final">First Name (<em>Given Name</em>)</div>
                        <div class="final"><asp:TextBox ID="txtReverifyFirstName" runat="server"></asp:TextBox></div>
                    </div>
                </div>
            </div> <!--End col30 -->    
            <div class="col10">
                <div class="innerWrapperFoo">
                    <div class="finalContainer" >
                        <div class="final">Middle Initial</div>
                        <div class="final"><asp:TextBox ID="txtReverifyMiddle" runat="server" Width="20px"></asp:TextBox></div>
                    </div>
                </div>
            </div> <!--End col10 -->    
            <div>
                <div>
                    <div class="finalContainer">
                        <div><B>B. </B>Date of Birth(<em>(mm/dd/yyyy)</em>)</div>
                        <div><asp:TextBox ID="txtReverifyRehireDate" Width="70px" class="datepicker"  runat="server"></asp:TextBox></div>
                    </div>
                </div>
            </div> <!--End Final -->
        </div> <!--End row-->
    </div> <!--End Attestation -->

    <br />
    <div id="divReveirfyDoc" class="attestation" runat="server">
        <div class="sectionHeader" style="background-color:white">
            <B>C.</B> If the employee's previous grant of employment authorization has expired, provide the information for the document or receipt that establishes continuing employment authorization in the space provided below.
        </div> <!-- End sectionheader -->
        <div class="row">
            <div class="col60">
                <div class="innerWrapper">
                    <div class="finalContainer">
                        Document Title:
                        <div><asp:TextBox ID="txtReverifyDocTitle" runat="server"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div class="col30">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>Document Number:</div>
                        <div><asp:TextBox ID="txtReverifyDocNumber" runat="server"></asp:TextBox></div>
                    </div>
                </div>
            </div>

            <div>
                <div class="finalContainer" >
                    <div>Expiration Date <em>(if any) (mm/dd/yyyy</em></div>
                    <div><asp:TextBox ID="txtReverifyDocDate" runat="server" class="datepicker" Width="120px"></asp:TextBox></div>
                </div>
            </div>


        </div> <!--End row -->
    </div> <!--End Attestation -->
    <br />
    <div class="review" style="display:flex;flex-direction:row"">
    
        <div>
            <b>I attest, under penalty of perjury, that to the best of my knowledge, this employee is authorized to work in the United States, and if
            the employee presented document(s), the document(s) I have examined appear to be genuine and to relate to the individual.</b>
        </div>
    </div>
    <br />
    <div id="divReverifySignature" class="attestation" runat="server">
        <div class="row">
            <div class="col40">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>Signature of Employer</div>
                        <div><asp:TextBox ID="txtReverifySignature" runat="server"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div id="divSignatureCertifiedReverify" runat="server" class="col10" style="flex-direction:column; justify-content:center;">
                <div class="innerWrapperFoo" style="flex-direction:column; justify-content:space-around">
                    <div class="finalContainer" style="flex-direction:column; justify-content:space-around">
                        <div>
                            Signature Certified: 
                        </div>
                        <div style="margin:0 auto; width:25%">
                            <asp:CheckBox ID="chkSignatureReverify" onclick ="showCheckSignature(this)" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col20">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>Today's Date <em>(mm/dd/yyyy): </em></div>
                        <div><asp:TextBox ID="txtReverifyDate" runat="server" class="datepicker"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div>
                <div class="finalContainer" >
                    <div>Name of Employer or Authorized Representative:</div>
                    <div><asp:TextBox ID="txtReverifyName" runat="server" Width="120px"></asp:TextBox></div>
                </div>
            </div>
        </div> <!--End row -->
    </div> <!--End Attestation -->

    <hr />
    <div class="review">
        Form I-9 11/14/2016 N
    </div>
</div>
    <div id="popuup_div" class="popup_msg">
        Cannot change this
    </div> 
    <div class="header-container">
        <div style="width:80%;display:flex;justify-content:space-between;align-items:center">
            <div>
                <img src="/Images/WH_I9Logo.jpg" height="46" style="margin-top:2px" />
            </div>
            <div style="font-family:Arial; height:50%">
                <b>Page Two</b>
            </div>
            <div>
                <asp:Button ID="btnViewPDF" runat="server" Text="View PDF" CssClass="button" OnClick="btnViewPDF_Click" />
                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="button" OnClick="btnEdit_Click" />  
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="button" OnClick="btnSave_Click"/>
                <asp:Button ID="btnDone" runat="server" Text="Done" CssClass="button" OnClick="btnDone_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="button" OnClick="btnCancel_Click" />
                <asp:Button ID="btnPage1" runat="server" Text="Page 1" CssClass="button" OnClick="btnPage1_Click" />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit I-9" CssClass="buttongreen" OnClick="btnSubmit_Click" />  
            </div>
        </div>
    </div>
    <div id="dialog" title="Basic dialog" style="display:none">
        <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
    </div>

    <div id="confirm" title="Basic dialog" style="display:none">
        <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
    </div>
    <asp:HiddenField ID="txtCertifyCertifySignatureDateH" runat="server" />
    <asp:HiddenField ID="txtReverifySignatureCertifyDateH" runat="server" />
    </form>
</body>
</html>
