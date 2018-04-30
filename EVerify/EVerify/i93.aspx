<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="i93.aspx.cs" Inherits="EVerify.i93" %>

<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1"] >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="datepicker/jquery-1.12.4.js"></script>
    <script src="datepicker/jquery-ui.js"></script>
    <link href="datepicker/style.css" rel="stylesheet" />
    <link href="datepicker/jquery-ui.css" rel="stylesheet" />
    <style type="text/css">
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
            border:1px solid black;
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
            $("input[type=text]").css("background-color", "#b0e0e6")


            $('input:text').focus(function () {
                $(this).css({ 'background': 'white' });
            });

            $('input:text').blur(function () {
                $(this).css({ 'background': '#b0e0e6'});
            });

            $('.datepicker').focus(function () {
                $(this).css({ 'background': '#b0e0e6' });
            });

            $('.datepicker').blur(function () {
                $(this).css({ 'background': '#b0e0e6' });
            });

            $(".readonly").focus(function () {
                $(this).blur();
            });

            /*$(".readonly").click(function () {
                $(this).blur();
                popup();
            });*/


            $(".readonly").hover(function () {
                $(this).css({'cursor': 'none'});
            })
            
            

            $(".readonly").click(function popup(e) {
                //getting height and width of the message box
                var height = $('#popuup_div').height();
                var width = $('#popuup_div').width();
                //calculating offset for displaying popup message
                leftVal = e.pageX - (width / 2)  + 50 + "px";
                topVal = e.pageY - (height / 2)  + 20 + "px";
                //show the popup message and hide with fading effect
                $('#popuup_div').css({ left: leftVal, top: topVal }).show().fadeOut(1200);

            });

            /*$("body").on("click", (".readonly"), popup)*/

            function setCheckBoxes() {
                if ($(this).prop('checked')) {
                    clickedID = $(this).prop('id')
                    $("[id*=chk").each(function () {
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

                $(".datepicker").blur();
            };

            function isNumberKey(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            }

            function hidedatepicker() {
                
                /**/
                $(".datepicker").datepicker("hide");
                $("#<%=txtAuthExpDate.ClientID%>.datepicker.ui-datepicker").hide()
                console.log($("#<%=txtAuthExpDate.ClientID%>.datepicker"))

            }



            $("body").on("focus", (".datepicker"), pickDate)

            $("body").on("click", ("[id*=chk]"), setCheckBoxes)
            
            $("body").on("keypress", (".numbers"), isNumberKey)

            $("body").on("focus", (".notdatepicker"), hidedatepicker)

        })

        $(function () {

            $("#datepicker").datepicker();

        });


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
        <div class="sectionHeader">
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
                    <div><asp:TextBox ID="txtOtherName" runat="server" TabIndex="-1" ></asp:TextBox></div>
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
            <div class="col30">
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
                        <div><asp:TextBox ID="txtState" runat="server" Width="25px" CssClass="readonly"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div>
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>ZIP Code</div>
                        <div><asp:TextBox ID="txtZip" runat="server" Width="45px" CssClass="readonly"></asp:TextBox></div>
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
            <div class="col30">
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
            <div class="col20">
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
    <br />
    <div class="attestation2">
        <b>I am aware that federal law provides for imprisonment and/or fines for false statements or use of false documents in
        connection with the completion of this form.<br />
        I attest, under penalty of perjury, that I am (check one of the following):</b>
    
        <div style="display:flex; flex-direction:column">
            <div style="display:flex; flex-direction:row">
                <div><asp:CheckBox ID="chkCitizen" runat="server" /></div><div style="margin-left:5px">A citizen of the United States</div><br />
            </div>
            <div style="display:flex; flex-direction:row">
                <div><asp:CheckBox ID="chkNonCitizen" runat="server" /></div><div style="margin-left:5px">A noncitizen national of the United States (See instructions)</div><br />
            </div>
            <div style="display:flex; flex-direction:row">
                <div><asp:CheckBox ID="chkPerm" runat="server" /></div><div style="margin-left:5px">A lawful permanent resident (Alien Registration Number/USCIS Number): <asp:TextBox ID="txtAlienNum1" runat="server" CssClass="numbers notdatepicker"  ></asp:TextBox></div><br />
            </div>
            
            <div style="display:flex; flex-direction:row">
                <div>
                    <asp:CheckBox ID="chkAlien" runat="server" CssClass="notdatepicker"/></div><div style="margin-left:5px">An alien authorized to work until (expiration date, if applicable, mm/dd/yyyy)
                        <input type="text" id="txtAuthExpDate" runat="server" class="datepicker" style="width:75px" />
                         Some aliens may write "N/A" in this field.<br /><em>(See instructions)<br />
                    For aliens authorized to work, provide your Alien Registration Number/USCIS Number <b>OR</b> Form I-94 Admission Number:</em><br />
                    <b>1.</b> Alien Registration Number/USCIS Number: <asp:TextBox ID="txtAlienNum2" CssClass="notdatepicker" runat="server"></asp:TextBox><br />
                    <b>OR</b><br />      
                    <b>2.</b> Form I-94 Admission Number: <asp:TextBox ID="txtI94Num" runat="server"></asp:TextBox><br />
                    If you obtained your admission number from CBP in connection with your arrival in the United States, include the following:
                    <div style="margin-left:15px; margin-top:8px">Foreign Passport Number: <asp:TextBox ID="txtForeignPPNum" runat="server"></asp:TextBox></div>
                    <div style="margin-left:15px; margin-top:8px">Country of Issuance: <asp:TextBox ID="txtForeignContry" runat="server"></asp:TextBox></div>
                    Some aliens may write "N/A" on the Foreign Passport Number and Country of Issuance fields. <em>(See instructions)</em>
                </div>
            </div>
        </div>
    </div> <!--End Attestation2-->
    
    <div class="attestation">
        <div class="row">
            <div class="col60">&nbsp;Signature of Employee: <span style="display: inline-block;margin-top:5px;margin-bottom:3px"><asp:TextBox ID="txtSig" runat="server" CssClass="notdatepicker" ></asp:TextBox></span>
            </div>
            <div class="col40">&nbsp;Date <em>(mm/dd/yyyy): </em><span style="display: inline-block;margin-top:5px"><asp:TextBox ID="txtSigDate" runat="server" class="datepicker"></asp:TextBox></span></div>
        </div>                
    </div>
    <br />
    <div class="attestation">
        <div class="sectionHeader">
            <b>Preparer and/or Translator Certification</b> <em>(To be completed and signed if Section 1 is prepared by a person other than the employee</em>
        </div>
        
    </div>
    <br />
    <div class="attestation2">
        <b>I attest, under penalty of perjury, that I have assisted in the completion of this form and that to the best of my knowledge the
        information is true and correct.</b>
    </div>
    <br />
    <div class="attestation">
        <div class="row">
            <div class="col60">
                <div class="innerWrapper">
                    <div class="finalContainer">
                        <div class="final">Signature of Preparer or Translator:</div>
                        <div class="final"><asp:TextBox ID="txtPrepSig" runat="server" CssClass="notdatepicker" ></asp:TextBox></div>
                    </div>
                </div>
            </div> <!--End col60 -->
     
            <div>
                <div class="finalContainer" >
                    <div>Date (<em>mm/dd/yyy</em>):</div>
                    <div><asp:TextBox ID="txtPrepDate" runat="server"></asp:TextBox></div>
                    </div>
            </div>
        </div> <!--End row -->

        <div style="border-top:1px solid black"></div>
        <div class="row">
            <div class="col80">
                <div class="innerWrapper">
                    <div class="finalContainer">
                        <div>Last Name<em>Family Name)</em>)</div>
                        <div><asp:TextBox ID="txtPrpLastName" runat="server"></asp:TextBox></div>
                    </div>
                    <div class="finalContainer" >
                        <div class="final">First Name (<em>Given Name</em>)</div>
                        <div class="final"><asp:TextBox ID="txtPrepFirstName" runat="server"></asp:TextBox></div>
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
                        <div><asp:TextBox ID="txtCompanyAddress" runat="server"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div class="col30">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>City or Town</div>
                        <div><asp:TextBox ID="txtCompanyCity" runat="server"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div class="col10">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>State</div>
                        <div><asp:TextBox ID="txtCompanyState" runat="server" Width="20px"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div>
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>ZIP Code</div>
                        <div><asp:TextBox ID="txtCompanyZip" runat="server" Width="20px"></asp:TextBox></div>
                    </div>
                </div>
            </div>
        </div> <!--End row -->
        
    </div> <!--End Attestation -->
    <div id="popuup_div" class="popup_msg">
        Cannot change this
    </div> 
            <p>Date: <input type="text" id="datepicker"></p>

    </form>
</body>
</html>
        