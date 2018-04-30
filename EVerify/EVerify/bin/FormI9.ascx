<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormI9.ascx.cs" Inherits="EVerify.FormI9" %>

<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" >

    <script src="/scripts/jquery-1.12.4.js"></script>
    <script src="/Scripts/jqueryUI/jquery-ui.js"></script>
    <link href="/Scripts/jqueryUI/jquery-ui.css" rel="stylesheet" />
    <link href="/jQueryUI/Smoothness/jquery-ui.theme.css" rel="stylesheet" />
    <link href="/css/Datepicker.css" rel="stylesheet" />
    
    <style type="text/css">

        .readonly {
            background-color: lightgray
        }

        .readwrite { 
            background-color: #b0e0e6
        }

        .header-container {
            background:#FFFACD;
            border:1px solid #666;
            display:flex;
            height:50px;
            justify-content:space-around;
            left:0;
            opacity:.97;
            position:fixed;
            top:0;
            width:100%;
    
        }

        .header-container input[type=submit] {
            font-size:12px

        }

        #topbanner {
            margin-top:5px;
            width:60%;
        }

        /*.preparer  input[type=text]{
            background-color: lightgray
        }*/

        /*.readwrite{
            background-color:green
        }*/

        .review {
            display:flex;
            flex-direction:column;
            justify-content:space-between;
            align-items:flex-start;
            width:90%;
            margin:0 auto;
            font-family:Calibri, Arial;
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
            /*background-color:#121780;*/
            background-color:#A7CBEF;
            color:darkblue;
        }

        .buttongreen {
            /*background-color:#121780;*/
            background-color:lightgreen;
            color:darkblue;
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
            margin:0 auto;
        }

        .ui-dialog .ui-dialog-buttonpane {
        	margin-top: 0;
        	padding: 0;
        }

        .ui-widget .ui-widget {
        	font-size: .8em;
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

        .readonlyCheckbox {

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

        .finalContainer {
            /*display:flex; 
            flex-direction:column; */
            margin: 0 5px;
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

        .notdatepicker {}

        #contentWrapper {
            position:absolute; 
            top:70px; 
            left:0;
            display:flex; 
            flex-direction:column;
            width:90%;
        }

        .SigCertifyEmp {
            background-color: lightsalmon;
        }

        .SigCertifyPreparer {
            background-color: lightsalmon;
        }

        .SigCertifyDisabled {
            background-color: lightgray;
        }

        @media all and (min-width: 990px) {

            #contentWrapper {
                width:100%
            }

           .header-container input[type=submit] {
                font-size:14px
            }

            /*.finalContainer  {
                width:100%
            }*/

            .finalContainer input[type=text]  {
                /*width:100%*/
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

            .innerWrapperFoo {
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

            $("#I9_txtState").hide()
            /*$(".readwrite").css("background-color", "#b0e0e6")*/
            
            /*$(".preparer  input[type=text]").css("background-color", "#b0e0e6")

            $(".preparer  input[type=text]").focus(function () {
                $(this).css({ 'background': 'white' });
            });

            $(".preparer input[type=text]").blur(function () {
                $(this).css({ 'background': '#b0e0e6'});
            });
            */

            //$(".readonly").css("background-color", "lightgray")

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
                    changeMonth: true,
                    changeYear: true,
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

            //$("body").on("click", ("input[type=checkbox]"), function(e) { alert('click') })

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
        
            //alert('foo')
            var btn = $("#<%=btnCancel.ClientID%>")
            if ($(btn).val() == "Done") {                
                
            
                $("input[type=text]").prop("disabled", true)
                $("input[type=checkbox]").prop("disabled", true)
                $("input[type=text]").css("background-color", "lightgray")
                $("input[type=text]").css("color", "black")
            }

            if ($("#<%=chkSignature.ClientID%>").prop('checked')) {
                $(".SigCertifyEmp").css("background-color", "lightgreen")
            }

            //if ($("#<%=chkSignaturePreparer.ClientID%>").prop('checked')) {
            //    $("#divSigCertifyPreparer").css("background-color", "lightgreen")
            //}

            /* Touch vs Mouse stuff
            function touchandler(e){
                alert('touch handler')
                e.preventDefault()
            }

            function mousehandler(){
                alert('mouse handler')
				
            }
			
            $("body").on("mousedown", ("input[type=text]"), mousehandler);
            $("body").on("touchend", ("input[type=text]"), touchandler);
            //$("body").on("focus", (".datepicker"), pickDate)			
            alert('asdf12344') */

            function checkdate(input){
                var validformat=/^\d{2}\/\d{2}\/\d{4}$/ //Basic check for format validity
                var returnval=false
                
                if ($(input).val() == "" ) return true
                if (!validformat.test($(input).val())) returnval = false
                    //showDialog("Invalid date", $(input).val() + " is not a valid date")
                    //alert("Invalid Date Format. Please correct and submit again.")
                else { //Detailed check for valid date ranges
                    var monthfield=input.value.split("/")[0]
                    var dayfield=input.value.split("/")[1]
                    var yearfield=input.value.split("/")[2]
                    var dayobj = new Date(yearfield, monthfield-1, dayfield)
                    if ((dayobj.getMonth()+1!=monthfield)||(dayobj.getDate()!=dayfield)||(dayobj.getFullYear()!=yearfield))
                        returnval = false
                        //showDialog("Invalid date", $(input).val() + " is not a valid date")
                        //alert("Invalid Day, Month, or Year range detected. Please correct and submit again.")}
                else returnval=true
                }
                //if (returnval==false)  { 
                //    //$(input).focus() 
                //    event.stopPropagation()
                //}
                    //input.select()
                return returnval
            }

            $("body").on("blur", (".datepicker"), function() { 
                //alert(event.target)
                //alert(checkdate(this))
                if (!checkdate(this)) {
                    //alert("Invalid date detected. Please correct.")
                    //$(event.target).focus()
                    var target = event.target
                    showDialog("Invalid date", $(this).val() + " is not a valid date.", target)
                    $(this).val("")
                    //showDialog("Invalid date", $(input).val() + " is not a valid date2")
                    //alert('fff')   
                }
            } ); // End of blur

        }) // *** End Ready function *** 

        function saveSuccessful(){
            messagetext = ""
            if ($("#<%=chkSignature.ClientID%>").prop('checked')) {
                messagetext = messagetext + "Signature certified"
                $("#dialog").css("background-color", "lightgreen")
            }
            else {
                messagetext = messagetext + "Signature not certified"
                $("#dialog").css("background-color", "lightsalmon")
            }
            $(".header-container input[type=submit]").prop("disabled", true)
            showDialog("Form I-9 - Saved", messagetext) 
            
            //alert('sent by C#')
        }

        function saveSuccessfulPrep(){
            messagetext = ""
            if ($("#<%=chkSignaturePreparer.ClientID%>").prop('checked')) {
                messagetext = messagetext + "Preparer signature certified"
                $("#dialog").css("background-color", "lightgreen")
            }
            else {
                messagetext = messagetext + "Preparer signature not certified"
                $("#dialog").css("background-color", "lightsalmon")
            }
            $(".header-container input[type=submit]").prop("disabled", true)
            showDialog("Form I-9 - Saved", messagetext) 
            
            //alert('sent by C#')
        }

        function submitSuccessful(){
            messagetext = "Your I-9 has been submitted to the HR Department.  <br>Thank you."
            $("#dialog").css("background-color", "lightgreen")
            
            showDialog("Form I-9 - Submit", messagetext) 
            
            //alert('sent by C#')
        }


        function changeAddress(e){
            $("#ddlStates").toggle()
            $("#txtState").toggle()

            if ($(e).prop('checked')) { 
                $("#divEmployee input[type=text]").removeClass("readonly")
                $("#I9_ddlStates").removeClass("readonly")
                $("#divEmployee input[type=text]").addClass("readwrite")
                $("#I9_ddlStates").addClass("readwrite")
                $("#I9_txtBirth").addClass("datepicker")
                $('.readwrite').off("focus") 
                $(".readwrite").css("background", "#b0e0e6")
                $('.readwrite').focus(function () {
                    $(this).css({ 'background': 'white' });
                });
                $('.readwrite').blur(function () {
                    $(this).css({ 'background': '#b0e0e6'});
                });
            }

            else {
                $("#divEmployee input[type=text]").addClass("readonly")
                $("#divEmployee input[type=text]").removeClass("readwrite")
                $("#divEmployee input[type=text]").removeClass("datepicker")
                $("#I9_ddlStates").removeClass("readwrite")
                $("#I9_ddlStates").addClass("readonly")
                $("#I9_txtBirth").css("color","black")
                $("#I9_txtBirth").datepicker("destroy")
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
        };

        function showCheckSignature(e) {
            this.blur()
            //var itemname = $(e).prop("id") 
            var signed = true;    
            var message
            targetItem = event.target

            switch ($(targetItem).prop("id")) {
                case "I9_chkSignature":
                    if ($('#<%=txtSig.ClientID%>').val() == "") {
                        signed = false
                        message = "You have not made an entry for Signature of Employee"
                        $("#<%=chkSignature.ClientID%>").prop("checked", false)
                    }
                    break;
                case "I9_chkSignaturePreparer":
                    if ($('#<%=txtPrepSig.ClientID%>').val() == "") {
                        signed = false;
                        message = "You have not made an entry for Signature of Preparer"
                        $("#<%=chkSignaturePreparer.ClientID%>").prop("checked", false)
                    }
                    break;

            }

            //if ($('#<%=txtSig.ClientID%>').val() == "") {
            if (signed == false) {
                showDialog('No signature', message)
                return
            }

            showConfirm("Certify Signature", "I hereby confirm that my name entered on this Form I-9 is my signature.")

            var element = $("#<%=txtSignatureCertifyEmpDateH.ClientID%>")
            $(element).val(Date.now)
        }

        function showDialog(title, text, target) {
                $( "#dialog" ).dialog({
                    title: title,
                    modal: true,
                    buttons : {
                        OK: function() {
                            $(event.target).focus()
                            $(this).dialog("close"); //closing on Ok click
                            //$("#I9_chkSignature").prop('checked', false)
                            $(".header-container input[type=submit]").prop("disabled", false)
                            $(target).focus()    
                        }
                    },

                    open: function (event, ui) {
                        $(this).html(text)
                    }
                });

        }

        function showConfirm(foo) {
            var foo2 = event.target
            var foo3 = $(foo2).parent().parent()

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

        function validityCheck(){
            var valid = false;

            if ($("#I9_chkCitizen").prop("checked") == true ) valid = true
            if ($("#I9_chkNonCitizen").prop("checked") == true ) valid = true
            if ($("#I9_chkPerm").prop("checked") == true ) valid = true
            if ($("#I9_chkAlien").prop("checked") == true ) valid = true
            if (!valid) {

                messagetext = "You must select one box to attest to your citizenship or immigration status."
                showDialog('Form incomplete', messagetext)
                //$("#I9_divEmployeeAttestation").css("background-color", "lightsalmon")
                $(".authorization").css("background-color", "lightsalmon")
                $("body").one("click", ("#contentWrapper"), function() { 
                    
                    $(".authorization").css("background-color", "white")
                })
                
                return false
            }
            return true
        }

    </script>

<div id="contentWrapper" >
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

    <div class="instructions">
        <hr />
        <b>START HERE. Read instructions carefully before completing this form. The instructions must be available during completion of this form.
		<br />
        ANTI-DISCRIMINATION NOTICE:</b> It is illegal to discriminate against work-authorized individuals. Employers CANNOT specify which
        document(s) they will accept from an employee. The refusal to hire an individual because the documentation presented has a future
        expiration date may also constitute illegal discrimination.
    </div>
    <div id="divEmployee" class="attestation">
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
                    <div><asp:TextBox ID="txtOtherName" runat="server" TabIndex="-1" CssClass="readonly" ></asp:TextBox></div>
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
                        <div><asp:TextBox ID="txtAptNum" runat="server" Width="40px" CssClass="readonly"></asp:TextBox></div>
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
                <div class="innerWrapperFoo">
                    <div class="finalContainer">
                        <div>Date of Birth(<em>(mm/dd/yyyy)</em>)</div>
                        <div><asp:TextBox ID="txtBirth" runat="server" CssClass="readonly"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div class="col20">
                <div class="innerWrapperFoo">
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
                <div class="innerWrapperFoo">
                    <div class="finalContainer" >
                        <div>Email Address</div>
                        <div><asp:TextBox ID="txtEmail" runat="server" Width="240px" CssClass="readonly"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div>

                    <div class="finalContainer" >
                        <div>Telephone Number</div>
                        <div><asp:TextBox ID="txtPhone" runat="server" Width="120px" CssClass="readonly"></asp:TextBox></div>
                    </div>

            </div>
        </div> <!--End row -->
        
    </div> <!--End Attestation -->
    <div class="attestation2" >
        <span><asp:CheckBox ID="chkChange" Text="Change Address" runat="server" onclick="changeAddress(this)" /></span>
        

    </div>
    <br />
    <div id="divEmployeeAttestation" runat="server" class="attestation2">
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
                <div><asp:CheckBox ID="chkPerm" runat="server" CssClass="authorization"/></div><div style="margin-left:5px">A lawful permanent resident (Alien Registration Number/USCIS Number): <asp:TextBox ID="txtAlienNum1" runat="server" CssClass="numbers readonly"  ></asp:TextBox></div><br />
            </div>

            <div id="divEmployeeAttestation2" runat="server" style="display:flex; flex-direction:row">
                <div>
                    <asp:CheckBox ID="chkAlien" runat="server" CssClass="notdatepicker authorization"/></div><div style="margin-left:5px">An alien authorized to work until (expiration date, if applicable, mm/dd/yyyy)
                        <asp:TextBox ID="txtAuthorizationExpDate" runat="server" class="readonly"></asp:TextBox>
                         Some aliens may write "N/A" in this field.<br /><em>(See instructions)<br />
                    Aliens authorized to work must provide only one of the following document numbers to complete form I-9:<br />
                    An alien Registration Number/USCIS Number <b>OR</b> Form I-94 Admission Number <b>OR</b> Foreign Passport Number.</em><br /><br />
                    <b>1.</b> Alien Registration Number/USCIS Number: <asp:TextBox ID="txtAlienNum2" runat="server" CssClass="numbers readonly"></asp:TextBox><br />
                    <b>OR</b><br />      
                    <b>2.</b> Form I-94 Admission Number: <asp:TextBox ID="txtI94Num" runat="server" CssClass="numbers readonly"></asp:TextBox><br />
                    <b>OR</b><br />      
                    <b>3.</b> Foreign Passport Number: <asp:TextBox ID="txtForeignPPNum" runat="server" CssClass="numbers readonly"></asp:TextBox><br />
                    
                    <div style="margin-left:15px; margin-top:8px">Country of Issuance: <asp:TextBox ID="txtForeignPPCountry" runat="server" CssClass="readonly"></asp:TextBox></div>

                </div>
            </div>
        </div>
    </div> <!--End Attestation2-->
    <br />
    <div id="divEmpSignature" runat="server" class="attestation">
        <div class="row">
            <div class="col50">
                <div>&nbsp;Signature of Employee: <span style="display: inline-block;margin-top:5px;margin-bottom:3px"><asp:TextBox ID="txtSig" Width="200px" runat="server" CssClass="notdatepicker readonly" ></asp:TextBox></span></div>
            </div>
            <div id="divSigCertifyEmp" runat="server" class="col20 SigCertifyEmp" ClientIDMode="static">
                <div style="margin-top:4px">
                    &nbsp;Signature Certified: 
                    <asp:CheckBox ID="chkSignature" onclick ="showCheckSignature(this)" runat="server" />
                </div>
            </div>
            <div class="finalContainer">
                <div>
                Date <em>(mm/dd/yyyy): </em><span style="display: inline-block;margin-top:5px"><asp:TextBox ID="txtSigDate" runat="server" class="readonly"></asp:TextBox></span>
                </div>
            </div>
        </div>                
    </div>
    <br />
    <div id="divPreparerCertification" runat="server" class="attestation">
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
    <div id="divPreparer" runat="server" class="attestation preparer">
        <div class="row">
            <div class="col50">
                <div class="innerWrapper">
                    <div class="finalContainer">
                        <div class="final">
                            Signature of Preparer or Translator:
                            <asp:TextBox ID="txtPrepSig" runat="server" CssClass="" ></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div> <!--End col60 -->
            <div id="divSigCertifyPreparer" runat="server" class="col20 SigCertifyPreparer" ClientIDMode="static">
                <div style="margin-top:4px">
                    &nbsp;Signature Certified: 
                    <asp:CheckBox ID="chkSignaturePreparer" onclick ="showCheckSignature(this)" runat="server" />
                </div>
            </div>     
            <div>
                <div class="finalContainer" >
                    <div>
                        Date (<em>mm/dd/yyy</em>):
                        <asp:TextBox ID="txtPrepDate" runat="server" class="datepicker"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div> <!--End row -->

        <div style="border-top:1px solid black"></div>
        <div class="row">
            <div class="col50">
                <div class="innerWrapper">
                    <div class="finalContainer">
                        <div>Last Name<em>Family Name)</em>)</div>
                        <div><asp:TextBox ID="txtPrepLastName" runat="server" CssClass=""></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div class="col50">
                <div class="finalContainer" >
                    <div class="final">First Name (<em>Given Name</em>)</div>
                    <div class="final"><asp:TextBox ID="txtPrepFirstName" runat="server" CssClass=""></asp:TextBox></div>
                </div>
             </div>
        </div> <!--End row -->

        <div style="border-top:1px solid black"></div>
        <div class="row">
            <div class="col40">
                <div class="innerWrapper">
                    <div class="finalContainer">
                        <div>Address(<em>Street number and name)</em>)</div>
                        <div><asp:TextBox ID="txtPrepAddress" Text="5986 Financial Drive" runat="server" CssClass=""></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div class="col30">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>City or Town</div>
                        <div><asp:TextBox ID="txtPrepCity" Text="Norcross" runat="server" CssClass=""></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div class="col10">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>State</div>
                        <div><asp:TextBox ID="txtPrepState" Text="GA" runat="server" Width="20px" CssClass=""></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div>
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>ZIP Code</div>
                        <div><asp:TextBox ID="txtPrepZip" Text="30071" runat="server" Width="40px"></asp:TextBox></div>
                    </div>
                </div>
            </div>
        </div> <!--End row -->
    </div> <!--End Attestation -->
    <br />
    <br />
    <hr />
    <div class="review">
        Form I-9 11/14/2016 N
    </div>
</div>

    <br />     
    <div class="attestation3">

    </div>
    <div id="popuup_div" class="popup_msg">
        Cannot change this
    </div> 

    <div id="dialog" title="Basic dialog" style="display:none">
        <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
    </div>

    <div id="confirm" title="Basic dialog" style="display:none">
        <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
    </div>

    <div class="header-container">
        <div style="width:80%;display:flex;justify-content:space-between; align-items:center; align-content:space-between">
            <div>
                <img src="/Images/WH_I9Logo.jpg" height="46" />
            </div>
            <div style="font-family:Arial; height:50%">
                <b>Page One</b>
            </div>
            <div style="" >
                <asp:Button ID="btnEmail" runat="server" Text="Email" CssClass="button" OnClick="btnEmail_Click" />  
                <asp:Button ID="btnViewPDF" runat="server" Text="View PDF" CssClass="button" OnClick="btnViewPDF_Click" />
                <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" CssClass="button" />  
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="button" OnClientClick="return validityCheck()" OnClick="btnSave_Click" />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit I-9" CssClass="buttongreen" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="button" OnClick="btnCancel_Click" />
                <asp:Button ID="btnDone" runat="server" Text="Done" CssClass="button" OnClick="btnDone_Click"  />
                <asp:Button ID="btnPage2" runat="server" Text="Page 2" CssClass="button" OnClick="btnPage2_Click" />
            </div>
        </div>
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
<asp:HiddenField ID="txtSignatureCertifyEmpDateH" runat="server" />
