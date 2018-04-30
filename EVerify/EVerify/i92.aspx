<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="i92.aspx.cs" Inherits="EVerify.i92" %>

<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1"] >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="scripts/jquery-1.12.4.js"></script>
    <script src="scripts/jquery-ui.js"></script>
    <link href="Styles/Datepicker.css" rel="stylesheet" />
    
    <style type="text/css">

        .preparer  input[type=text]{
            background-color: lightgray
        }

        .readwrite{
            background-color:green
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

 
        input[type=checkbox], input[type=radio] {
            vertical-align: middle;
            position: relative;
            bottom: 1px;
        }

        .button {
            background-color:#121780;
            color:white;

        }
        .ui-state-highlight {
            background-color:yellow;
        }

        .ui-state-highlight {
            background-color:yellow;
        }
            
        .ui-datepicker-days-cell-over.ui-datepicker-today {
                background-color:yellow;
        }

        .ui-datepicker-current-day {
            background-color:yellow ;
        }

        .ui-datepicker-days-cell-over {
            background-color: #B6B6B4;  

        }
        .ui-datepicker tr td:hover{
            background-color: #A9A9A9
        }

        .ui-state-active {
            background-color: yellow;
        }

        .ui-datepicker-calendar{
            margin:0 auto
        }

        .finalContainer input[type=text]  {
            width:150px
        }

        

        .header {
            display:flex;
            flex-direction:row;
            width:100%;
            margin:0 auto;
            justify-content:space-between;
			align-items:center;
            text-align:center;
        }
		
		instructions {
			width:100%;
		}

        .attestation {
            border:1px solid black;
            display:flex;
            flex-direction:column;
            overflow:auto
        }
        
        .attestation > div {
            font-family:Calibri;
        }

        .attestation2 {

            display:flex;
            flex-direction:column;
            overflow:auto;
            font-family:Calibri;
        }

        .attestation2 > div {
            font-family:Calibri;
        }

        .sectionHeader {
            
            background-color:lightgray;
            font-family:Calibri
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

        .finalContainer {
            display:flex; 
            flex-direction:column; 
            margin: 0 5px;
        }

        .innerWrapper {
            display:flex; 
            flex-direction:column;
            justify-content:space-between;
        }

        .notdatepicker {}

        @media all and (min-width: 840px) {

            .finalContainer input[type=text]  {
                width:100%

            }

            .row{width:100%}

			.header {
				width:80%;
			}

			.instructions {
				width:80%;
				margin:0 auto;
			}
			
            .attestation {
                justify-content:space-between; width:80%;
				width:80%;				
                margin:0 auto
            }

            .attestation2 {
                justify-content:space-between; width:80%;
				width:80%;				
                margin:0 auto
            }
            
            .attestation3 {
                
                display:flex;
                flex-direction:row-reverse;
                overflow:auto;
                width:80%;			
                margin:0 auto;	
            }
        
            
            .innerWrapper {
                display:flex; 
                flex-direction:row;
                justify-content:space-between;
            }

            .row {
                flex-direction: row;
                margin:0;
            }

            .col80 {
                flex:0 1 80%;
                padding-bottom:5px;
            }

            .col60 {
                flex:0 1 60%;
                border-right:1px solid black;
                padding-bottom:5px;
                
            }

            .col40 {
                flex:0 1 40%;
                border-right:1px solid black;
                border-right:1px solid black;padding-bottom:5px  

            }

            .col30 {
                flex:0 1 30%;
                border-right:1px solid black;
                padding-bottom:5px  
            }

            .col20 {
                flex:0 1 20%;
                border-right:1px solid black;
                padding-bottom:5px  
            }

            .col10 {
                flex:0 1 10%;
                border-right:1px solid black;
            }


        }
    </style>

    <script type="text/javascript">
        $( document ).ready(function() {
            $(".readwrite").css("background-color", "#b0e0e6")
            
            /*$(".preparer  input[type=text]").css("background-color", "#b0e0e6")

            $(".preparer  input[type=text]").focus(function () {
                $(this).css({ 'background': 'white' });
            });

            $(".preparer input[type=text]").blur(function () {
                $(this).css({ 'background': '#b0e0e6'});
            });
            */

            $(".readonly").css("background-color", "lightgray")

            $('.readwrite').focus(function () {
                $(this).css({ 'background': 'white' });
            });

            $('.readwrite').blur(function () {
                $(this).css({ 'background': '#b0e0e6'});
            });

            $(".datepicker").css("background-color", "#b0e0e6")

            $('.datepicker').focus(function () {
                $(this).css({ 'background': 'white' });
            });

            $('#ddlStates').focus(function () {
                $(this).css({ 'background': 'white'});
            });

            $('#ddlStates').blur(function () {
                $(this).css({ 'background': '#b0e0e6'});
            });


            $('.datepicker').focus(function () {
                $(this).css({ 'background': '#b0e0e6' });
            });

            $('.datepicker').blur(function () {
                $(this).css({ 'background': '#b0e0e6' });
            });

            /*$(".readonly").focus(function () {
                $(this).blur();
            });*/

            /*$(".readonly").click(function () {
                $(this).blur();
                popup();
            });*/


            /*$(".readonly").hover(function () {
                $(this).css({'cursor': 'none'});
            })*/
            

            /*$("body").on("click", (".readonly"), popup)*/

            function setCheckBoxes() {
                if ($(this).prop('checked')) {
                    clickedID = $(this).prop('id')
                    $(".authorization [id*=chk").each(function () {
                        if ($(this).prop('id') != clickedID) {
                            $(this).prop('checked', false)
                        }
                    })
                }
            }

            function pickDate() {
                $(".datepicker").datepicker({
                    showOtherMonths: true,
                    dayNamesMin: ['Su', 'Mo', 'Tu', 'We', 'Thu', 'Fr', 'Sa']
                });

                /*$(".datepicker").blur();*/
            };

            function isNumberKey(evt) {
                /*console.log(evt.pageX)
                console.log(evt.pageY)
                console.log(evt)
                console.log($(this).offset().left)
                console.log($(this).offset().top)
                console.log($("#<%=txtAlienNum1.ClientID%>").offset())*/
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                {leftVal = $(this).offset().left
                    topVal = $(this).offset().top + 25
                    $('#popuup_div').text("Number only")
                    $('#popuup_div').css({ left: leftVal, top: topVal }).show().fadeOut(2200);
                
                    return false;}
                else return true;
            }

            $("body").on("focus", (".datepicker"), pickDate)

            $("body").on("click", (".authorization [id*=chk]"), setCheckBoxes)
            
            /*$("body").on("click", (".readonly"), popup)*/
            
            $(".readonly").focus(function(){
                popup(this);
            })
            
            $("body").on("keypress", (".numbers"), isNumberKey)

            $("#ddlStates").toggle()

            $(".preparer  input[type=text]").focus(function(){
                if ($("#chkAssistYes").prop("checked") == false) { 
                    var height = $('#popuup_div').height();
                    var width = $('#popuup_div').width();
                    //calculating offset for displaying popup message
                    leftVal = $(this).position().left - (width / 2)  + 70 + "px";
                    topVal = $(this).position().top - (height / 2)  + 40 + "px";
                    //show the popup message and hide with fading effect
                    $('#popuup_div').text('Check appropriate box to change this section')
                    $('#popuup_div').css({ left: leftVal, top: topVal }).show().fadeOut(2200);
                    $('#popuup_div').css({ height: 50 })
                    $(this).blur()
                            

                }
                
            })

            $("[id*=chkAssist").click(function(){
                
                clickedID = $(this).prop('id')            
                $("[id*=chkAssist").each(function () {
                    if ($(this).prop('id') != clickedID) {
                        $(this).prop('checked', false)
                    }
                })
                if ($("#chkAssistYes").prop("checked") == true) {
                    $(".preparer  input[type=text]").css("background-color", "#b0e0e6")
                    $(".preparer  input[type=text]").focus(function(){
                        $(this).css("background-color", "white")
                    })
                    $(".preparer  input[type=text]").blur(function(){
                        $(this).css("background-color", "#b0e0e6")
                    })
                    $("#txtPrepDate").addClass("datepicker")
                    $("#txtPrepDate").off("blur")
                }
                else {
                    $(".preparer  input[type=text]").css("background-color", "lightgray")
                    $(".preparer  input[type=text]").focus(function(){
                        $(this).css("background-color", "lightgray")
                    })
                    $(".preparer  input[type=text]").blur(function(){
                        $(this).css("background-color", "lightgray")
                    })
                    
                    $("#txtPrepDate").removeClass("hasDatepicker")
                    $("#txtPrepDate").removeClass("datepicker")
                    $("#txtPrepDate").focus(function(){
                        $("#txtPrepDate").blur()
                        $(".ui-datepicker").hide()
                    })
                }

            })
        
        
        }) // *** End Ready function ***

        function changeAddress(e){
            $("#ddlStates").toggle()
            $("#txtState").toggle()
            if ($(e).prop('checked')) { 
                    $('.readonly').off("focus") 
                    //$(this).css({ 'background': 'white' });
                    //$(this).css({ 'background': '#b0e0e6'});
                    $(".readonly").css("background", "#b0e0e6")
                    $('.readonly').focus(function () {
                        $(this).css({ 'background': 'white' });
                });
                $('.readonly').blur(function () {
                    $(this).css({ 'background': '#b0e0e6'});
                });
            }
            else {
                $(".readonly").focus(function(){
                    popup(this);
                })
                $('.readonly').blur(function () {
                    $(this).css({ 'background': 'lightgray'});
                });
                $(".readonly").css("background", "lightgray")
                $("#txtLastName").val($("#txtLastNameH").val())
                $("#txtFirstName").val($("#txtFirstNameH").val())
                $("#txtMiddleName").val($("#txtMiddletH").val())
                $("#txtAddress").val($("#txtAddressH").val())
                $("#txtCity").val($("#txtCityH").val())
                $("#txtZip").val($("#txtZipH").val())
                $("#txtZip4").val($("#txtZip4H").val())
                $("#txtBirth").val($("#txtBirthH").val())
                $("#txtSSN1").val($("#txtSSN1H").val())
                $("#txtSSN2").val($("#txtSSN2H").val())
                $("#txtSSN3").val($("#txtSSN3H").val())
                $("#txtPhone").val($("#txtPhoneH").val())
                $("#txtEmail").val($("#txtEmailH").val())

                
            }
        }

        function popup(e) {
            //getting height and width of the message box
            $('#popuup_div').toggle()
            var height = $('#popuup_div').height();
            var width = $('#popuup_div').width();
            //calculating offset for displaying popup message
            leftVal = $(e).position().left - (width / 2)  + 70 + "px";
            topVal = $(e).position().top - (height / 2)  + 40 + "px";
            //show the popup message and hide with fading effect
            $('#popuup_div').text('Cannot change this')
            $('#popuup_div').css({ height: 20 })
            $('#popuup_div').css({ left: leftVal, top: topVal }).show().fadeOut(2000);
            $(e).blur()
            
            
            
            console.log(e)
            console.log($(e))
        };

    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="header">
        <div class="left">
            <img src="/Images/DHS_seal.png" />
        </div>
        <div class="center">
			<b>Employment Eligibility Verification<br /><br />
			Department of Homeland Security</b><br />
			U.S. Citizenship and Immigration Services
        </div>
        <div class="right">
			<b>USCIS<br />
			Form I-9<br /></b>
			OMB No. 1615-0047<br />
			Expires 03/31/2016
        </div>
    </div>
	<hr />
    <div class="instructions">
        <b>START HERE. Read instructions carefully before completing this form. The instructions must be available during completion of this form.
		<br />
        ANTI-DISCRIMINATION NOTICE:</b> It is illegal to discriminate against work-authorized individuals. Employers CANNOT specify which
        document(s) they will accept from an employee. The refusal to hire an individual because the documentation presented has a future
        expiration date may also constitute illegal discrimination.
    </div>
    <div class="attestation">
        <div class="sectionHeader" style="border-bottom:1px solid black">
            <b>Section 1. Employee Information and Attestation</b> <em>(Employees must complete and sign Section 1 of Form I-9 no later
            than the <b>first day of employment,</b> but not before accepting a job offer.)</em>
        </div>
        <div class="row">
            <div class="col60">
                <div class="innerWrapper">
                        <div class="finalContainer">
                            <div class="final">Last Name (<em>Family Name</em>)</div>
                            <div class="final"><asp:TextBox ID="txtLastName" runat="server" CssClass="readonly"></asp:TextBox></div>
                        </div>
                        <div class="finalContainer" >
                            <div class="final">First Name (<em>Given Name</em>)</div>
                            <div class="final"><asp:TextBox ID="txtFirstName" runat="server" CssClass="readonly"></asp:TextBox></div>
                        </div>

                        <div class="finalContainer" >
                            <div class="final">Middle Initial</div>
                            <div class="final"><asp:TextBox ID="txtMiddle" runat="server" Width="20px" CssClass="readonly"></asp:TextBox></div>
                        </div>
                </div>
            </div> <!--End col60 -->
     
            <div>
                <div class="finalContainer" >
                    <div>Other Names (<em>if any</em>)</div>
                    <div><asp:TextBox ID="txtOtherName" runat="server" TabIndex="-1" CssClass="readwrite" ></asp:TextBox></div>
                    </div>
            </div>
        </div> <!--End row -->

        <div style="border-top:1px solid black"></div>
        <div class="row">
            <div class="col40">
                <div class="innerWrapper">
                    <div class="finalContainer">
                        <div>Address(<em>Street number and name)</em>)</div>
                        <div><asp:TextBox ID="txtAddress" runat="server" CssClass="readonly"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div class="col10">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>Apt. Number</div>
                        <div><asp:TextBox ID="txtAptNum" runat="server" Width="20px" CssClass="readonly"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div class="col20">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>City or Town</div>
                        <div><asp:TextBox ID="txtCity" runat="server" CssClass="readonly"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div class="col10">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>State</div>
                        <div>
                            <asp:TextBox ID="txtState" runat="server" Width="25px" CssClass="readonly"></asp:TextBox>
                            <asp:DropDownList ID="ddlStates" runat="server" CssClass="readonly"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>ZIP Code</div>
                        <div><asp:TextBox ID="txtZip" runat="server" Width="45px" CssClass="readonly"></asp:TextBox>
                            - <asp:TextBox ID="txtZip4" Width="35px" CssClass="readonly" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!--End row -->

        <div style="border-top:1px solid black"></div>
        <div class="row">
            <div class="col30">
                <div class="innerWrapper">
                    <div class="finalContainer">
                        <div>Date of Birth(<em>(mm/dd/yyyy)</em>)</div>
                        <div><asp:TextBox ID="txtBirth" runat="server" CssClass="readonly"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div class="col20">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>U.S. Social Security Number</div>
                            <div style="display:flex">
                                <div><asp:TextBox ID="txtSSN1" runat="server" Width="30px" CssClass="readonly"></asp:TextBox></div> -
                                <div><asp:TextBox ID="txtSSN2" runat="server" Width="20px" CssClass="readonly"></asp:TextBox></div> - 
                                <div><asp:TextBox ID="txtSSN3" runat="server" Width="35px" CssClass="readonly"></asp:TextBox></div>
                            </div>
                    </div>
                </div>
            </div>
            <div class="col30">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>Email Address</div>
                        <div><asp:TextBox ID="txtEmail" runat="server" Width="240px" CssClass="readonly"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div>
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>Telephone Number</div>
                        <div><asp:TextBox ID="txtPhone" runat="server" Width="120px" CssClass="readonly"></asp:TextBox></div>
                    </div>
                </div>
            </div>
        </div> <!--End row -->
        
    </div> <!--End Attestation -->
    <div class="attestation2" >
        <span><asp:CheckBox ID="chkChange" Text="Change Address" runat="server" onclick="changeAddress(this)" /></span>
        

    </div>
    <br />
    <div class="attestation2">
        <b>I am aware that federal law provides for imprisonment and/or fines for false statements or use of false documents in
        connection with the completion of this form.<br />
        I attest, under penalty of perjury, that I am (check one of the following):</b>
    
        <div style="display:flex; flex-direction:column; border:1px solid black">
            <div style="display:flex; flex-direction:row;border-bottom:1px solid black">
                <div><asp:CheckBox ID="chkCitizen" runat="server" CssClass="authorization" /></div><div style="margin-left:5px">A citizen of the United States</div><br />
				</div>
            <div style="display:flex; flex-direction:row;border-bottom:1px solid black"">
                <div><asp:CheckBox ID="chkNonCitizen" runat="server" CssClass="authorization" /></div><div style="margin-left:5px">A noncitizen national of the United States (See instructions)</div><br />
            </div>
            <div style="display:flex; flex-direction:row;border-bottom:1px solid black"">
                <div><asp:CheckBox ID="chkPerm" runat="server" CssClass="authorization"/></div><div style="margin-left:5px">A lawful permanent resident (Alien Registration Number/USCIS Number): <asp:TextBox ID="txtAlienNum1" runat="server" CssClass="numbers readwrite"  ></asp:TextBox></div><br />
            </div>
            
            <div style="display:flex; flex-direction:row">
                <div>
                    <asp:CheckBox ID="chkAlien" runat="server" CssClass="notdatepicker authorization"/></div><div style="margin-left:5px">An alien authorized to work until (expiration date, if applicable, mm/dd/yyyy)
                        <input type="text" id="txtAuthExpDate" runat="server" class="datepicker" style="width:75px" />
                         Some aliens may write "N/A" in this field.<br /><em>(See instructions)<br />
                    Aliens authorized to work must provide only one of the following document numbers to complete form I-9:<br />
                    An alien Registration Number/USCIS Number <b>OR</b> Form I-94 Admission Number <b>OR</b> Foreign Passport Number.</em><br /><br />
                    <b>1.</b> Alien Registration Number/USCIS Number: <asp:TextBox ID="txtAlienNum2" runat="server" CssClass="numbers readwrite"></asp:TextBox><br />
                    <b>OR</b><br />      
                    <b>2.</b> Form I-94 Admission Number: <asp:TextBox ID="txtI94Num" runat="server" CssClass="numbers readwrite"></asp:TextBox><br />
                    <b>OR</b><br />      
                    <b>3.</b> Foreign Passport Number: <asp:TextBox ID="txtForeignPPNum" runat="server" CssClass="numbers readwrite"></asp:TextBox><br />
                    
                    <div style="margin-left:15px; margin-top:8px">Country of Issuance: <asp:TextBox ID="txtForeignPPCountry" runat="server" CssClass="readwrite"></asp:TextBox></div>

                </div>
            </div>
        </div>
    </div> <!--End Attestation2-->
    <br />
    <div class="attestation">
        <div class="row">
            <div class="col60">&nbsp;Signature of Employee: <span style="display: inline-block;margin-top:5px;margin-bottom:3px"><asp:TextBox ID="txtSig" runat="server" CssClass="notdatepicker readwrite  " ></asp:TextBox></span>
            </div>
            <div class="col40">&nbsp;Date <em>(mm/dd/yyyy): </em><span style="display: inline-block;margin-top:5px"><asp:TextBox ID="txtSigDate" runat="server" class="datepicker"></asp:TextBox></span></div>
        </div>                
    </div>
    <br />
    <div class="attestation">
        <div class="sectionHeader">
            <b>Preparer and/or Translator Certification (check one):</b> 
            <br />
            <asp:CheckBox ID="chkAssistNo" runat="server" Text="I did not use a perparer or translator." />
            <asp:CheckBox ID="chkAssistYes" runat="server" Text="A preparer(s) and/or translator(s) assisted the employee in completing Section 1." />
            <br />
            <em>(Fields below must be completed and signed we preparers and/or translators assist an employee in completing Section 1.)</em>
        </div>
        
    </div>
    <br />
    <div class="attestation2">
        <b>I attest, under penalty of perjury, that I have assisted in the completion of this form and that to the best of my knowledge the information is true and correct.</b>
    </div>
    <br />
    <div class="attestation preparer">
        <div class="row">
            <div class="col60">
                <div class="innerWrapper">
                    <div class="finalContainer">
                        <div class="final">Signature of Preparer or Translator:</div>
                        <div class="final"><asp:TextBox ID="txtPrepSig" runat="server" CssClass="" ></asp:TextBox></div>
                    </div>
                </div>
            </div> <!--End col60 -->
     
            <div>
                <div class="finalContainer" >
                    <div>Date (<em>mm/dd/yyy</em>):</div>
                    <div><asp:TextBox ID="txtPrepDate" runat="server" ></asp:TextBox></div>
                    </div>
            </div>
        </div> <!--End row -->

        <div style="border-top:1px solid black"></div>
        <div class="row">
            <div class="col80">
                <div class="innerWrapper">
                    <div class="finalContainer">
                        <div>Last Name<em>Family Name)</em>)</div>
                        <div><asp:TextBox ID="txtPrpLastName" runat="server" CssClass=""></asp:TextBox></div>
                    </div>
                    <div class="finalContainer" >
                        <div class="final">First Name (<em>Given Name</em>)</div>
                        <div class="final"><asp:TextBox ID="txtPrepFirstName" runat="server" CssClass=""></asp:TextBox></div>
                    </div>
                </div>
            </div>
        </div> <!--End row -->

        <div style="border-top:1px solid black"></div>
        <div class="row">
            <div class="col40">
                <div class="innerWrapper">
                    <div class="finalContainer">
                        <div>Address(<em>Street number and name)</em>)</div>
                        <div><asp:TextBox ID="txtPrepAddress" runat="server" CssClass=""></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div class="col30">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>City or Town</div>
                        <div><asp:TextBox ID="txtPrepCity" runat="server" CssClass=""></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div class="col10">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>State</div>
                        <div><asp:TextBox ID="txtPrepState" runat="server" Width="20px" CssClass=""></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div>
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>ZIP Code</div>
                        <div><asp:TextBox ID="txtPrepZip" runat="server" Width="20px"></asp:TextBox></div>
                    </div>
                </div>
            </div>
        </div> <!--End row -->
        
    </div> <!--End Attestation -->
    <br />     
    <div class="attestation3">
        
            <asp:Button ID="Button1" runat="server" Text="Page 2" CssClass="button" OnClick="Button1_Click" />
        
    </div>
    <div id="popuup_div" class="popup_msg">
        Cannot change this
    </div> 
        <asp:HiddenField ID="txtLastNameH" runat="server" />
        <asp:HiddenField ID="txtFirstNameH" runat="server" />
        <asp:HiddenField ID="txtMiddleH" runat="server" />
        <asp:HiddenField ID="txtAddressH" runat="server" />
        <asp:HiddenField ID="txtCityH" runat="server" />
        <asp:HiddenField ID="txtStateH" runat="server" />
        <asp:HiddenField ID="txtZipH" runat="server" />
        <asp:HiddenField ID="txtZip4H" runat="server" />
        <asp:HiddenField ID="txtBirthH" runat="server" />
        <asp:HiddenField ID="txtSSN1H" runat="server" />
        <asp:HiddenField ID="txtSSN2H" runat="server" />
        <asp:HiddenField ID="txtSSN3H" runat="server" />
        <asp:HiddenField ID="txtEmailH" runat="server" />
        <asp:HiddenField ID="txtPhoneH" runat="server" />
    </form>
</body>
</html>
        