<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormI9.ascx.cs" Inherits="EVerify.FormI9" %>

<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" >

    <script src="/scripts/jquery-1.12.4.js"></script>
    <script src="/Scripts/jqueryUI/jquery-ui.js"></script>
    <link href="/Scripts/jqueryUI/jquery-ui.css" rel="stylesheet" />
    <link href="/jQueryUI/Smoothness/jquery-ui.theme.css" rel="stylesheet" />
    <link href="/css/Datepicker.css" rel="stylesheet" />
    <link href="datepicker/jquery-ui.css" rel="stylesheet" />
    <link href="datepicker/style.css" rel="stylesheet" />
    <script src="datepicker/jquery-1.12.4.js"></script>
    <script src="datepicker/jquery-ui.js"></script>    

    <style type="text/css">

         #logo {
             /*height:175px;
             width:350px;
             */

         }
         #chkPerm {
             display:none
         }

         #chkAlien {
             display:none
         }

        .centerWrapper {
            display:flex; 
            flex-direction:column; 
            height:35px;
            justify-content:center; 
            margin:0 auto; 
            width:90%; 
        }

        .centerInner{
            display:flex; 
            flex-direction:row; 
            width:90%; 
            margin:0 auto; 
            justify-content:center
        }

        .justifyLeft {
            display:flex; 
            flex-direction:row; 
            width:25%; 
            margin:0 auto; 
            justify-content:initial;
            
        }

        .datepicker2 {
            background-color:lightblue
        }

        .continueButton {
            background-color:#CC0000;
            color:white;
            height:30px;
            padding:5px;
            width:80%;
            max-width:150px;
            border-radius:7px;
            margin:5px 0  
            

        }

        #btnContinueEmployeeAttestation {
            background-color:#CC0000;
            color:white;
            height:30px;
            padding:5px
        }

        #I9_divCitizenhipQuestions {
            display:none;
        }

        #divChkNonCitizen {
            display:none;
        }

        #divChkPerm {
            display:none;
        }

        #divChkAlien {
            display:none;
        }

        #divEmployeeAttestation {
            display:none;
        }

        #divEmpSignature {
            display:none;
        }

        #divPreparerCertification {
            display:none;
        }

        #I9_divPreparer {
            display:none;
        }

        a {
            color: #0254EB
        }

        a:visited {
        	color: #0254EB
        }
        
        a.morelink {
        	text-decoration: none;
        	outline: none;
        }
        
        .morecontent span {
        	display: none;
        }

        .comment {
        	width: 400px;
        	background-color: white;
        	margin: 10px;
            width:100%;
            font-family:Calibri;
            margin:0 auto;
        }
        
        
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
            /*position:fixed;
            top:0;*/
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

        .itemRed {
            background-color: lightsalmon
        }

        .buttongreen {
            /*background-color:#121780;*/
            background-color:lightgreen;
            color:darkblue;
        }

        .buttonred {
            background-color:lightsalmon;
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
            flex-direction:column;
            width:50%;
            margin:0 auto;
            justify-content:center;
			align-items:center;
            text-align:center;
            font-family: 'Arial';
            font-size:28px;
            font-weight:600
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
            /*overflow:auto;*/
            justify-content:space-between; width:80%;
            width:90%;				
            margin:0 auto
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
            
            /*background-color:lightgray;*/
            font-family:Calibri
        }
        
        .row {
            display:flex;
            flex-direction:column;
            margin:0 auto 10px auto;

            width:100%;
        }

        .finalContainer {
            /*display:flex; 
            flex-direction:column; */
            /*margin: 0 auto;*/
            margin-left:35px;
            margin-top:5px;
            width:100%
        }

        .innerWrapper {
            display:flex; 
            flex-direction:column;
            justify-content:space-between;
            width:50%;
            /*margin:0 auto*/
        }

        .innerWrapperFoo {
            display:flex; 
            flex-direction:column;
            justify-content:space-between;
            width:50%;
            /*margin:0 auto*/

        }

        .notdatepicker {}

        #contentWrapper {
            /*position:absolute; 
            top:70px; 
            left:0;*/
            display:flex; 
            flex-direction:column;
            /*width:90%;*/
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

            .attestation {
                justify-content:space-between; width:80%;
				width:25%;				
                margin:0 auto
            }   


        }
    </style>

    <script type="text/javascript">6
        $( document ).ready(function() {
            //End more... link handling
            var showChar = 150;
            var ellipsestext = "";
            var moretext = "more ...";
            var lesstext = "less ...";
            $('.more').each(function() {
                var content = $(this).html();

                if(content.length > showChar) {

                    var c = content.substr(0, showChar);
                    var h = content.substr(showChar, content.length - showChar);

                    var html = c + '<span class="moreellipses">' + ellipsestext+ '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';

                    $(this).html(html);
                }

            });

            $(".morelink").click(function(){
                if($(this).hasClass("less")) {
                    $(this).removeClass("less");
                    $(this).html(moretext);
                } else {
                    $(this).addClass("less");
                    $(this).html(lesstext);
                }
                $(this).parent().prev().toggle();
                $(this).prev().toggle();
                return false;
            });

        //End more... link handling

            //$("#ddlStates").prop('disabled', true);
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

            $('.readwrite').focus(function () {
                var prompt = $(this).attr("prompt")
                if ( $(this).val() == prompt ) $(this).val("")
                $(this).css({ 'background': 'white' });
            });

            $('.readwrite').blur(function () {
                $(this).css({ 'background': '#b0e0e6'});
                if ( $(this).val() == "" ) $(this).val($(this).attr("prompt"))
                //alert($(this).val())
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

            $('#txtAlienNum1').focus(function () {
                $(this).css({ 'background': 'white'});
            });

            $('#txtAlienNum1').blur(function () {
                $(this).css({ 'background': '#b0e0e6'});
            });

            $('#txtAlienNum1').focus(function () {
                $(this).css({ 'background': 'white'});
            });

            $('#txtAlienNum1').blur(function () {
                $(this).css({ 'background': '#b0e0e6'});
            });

            $('#txtAuthorizationExpDate').focus(function () {
                $(this).css({ 'background': 'white'});
            });

            $('#txtAuthorizationExpDate').blur(function () {
                $(this).css({ 'background': '#b0e0e6'});
            });

            $('#txtAlienNum2').focus(function () {
                $(this).css({ 'background': 'white'});
            });

            $('#txtAlienNum2').blur(function () {
                $(this).css({ 'background': '#b0e0e6'});
            });

            $('#txtI94Num').focus(function () {
                $(this).css({ 'background': 'white'});
            });

            $('#txtI94Num').blur(function () {
                $(this).css({ 'background': '#b0e0e6'});
            });

            $('#txtForeignPPNum').focus(function () {
                $(this).css({ 'background': 'white'});
            });

            $('#txtForeignPPNum').blur(function () {
                $(this).css({ 'background': '#b0e0e6'});
            });

            $('#txtForeignPPCountry').focus(function () {
                $(this).css({ 'background': 'white'});
            });

            $('#txtForeignPPCountry').blur(function () {
                $(this).css({ 'background': '#b0e0e6'});
            });
            $('.datepicker').focus(function () {
                $(this).css({ 'background': '#b0e0e6' });
            });

            $('.datepicker').blur(function () {
                if ( $(this).val() == "" ) $(this).val($(this).attr("prompt"))
                $(this).css({ 'background': '#b0e0e6' });
            });

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
                var targetTemp = event.target
                var targetID = $(targetTemp).prop("id")
                
                $(".datepicker").datepicker({ //for dates in the future
                    changeMonth: true,
                    changeYear: true,
                    minDate: new Date,
                    showOtherMonths: true,
                    dayNamesMin: ['Su', 'Mo', 'Tu', 'We', 'Thu', 'Fr', 'Sa']
                });

                /*$(".datepicker").blur();*/
            };

            function pickDate2() { //for dates in the past
                var targetTemp = event.target
                var targetID = $(targetTemp).prop("id")

                $(".datepicker2").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    maxDate: new Date,
                    yearRange: "1948:2002",
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

            $("#rblCitizen").click(function() {

                if ( $('#rblCitizen input:checked').val() != "No" && $('#rblCitizen input:checked').val() != "Yes") { 
                    return
                }
                if ( $('#rblCitizen input:checked').val() == "No") {
                    $("#divChkNonCitizen").show()
                    $("#divPreparerCertification").hide()
                }

                else { 
                    $("#divChkNonCitizen").hide()
                    $("#divChkPerm").hide()
                    $("#divChkAlien").hide()
                    $("#divChkNonCitizen input[type=radio]").prop('checked',false); 
                    $("#divChkPerm input[type=radio]").prop('checked',false); 
                    $("#divChkAlien input[type=radio]").prop('checked',false); 
                    $("#divEmployeeAttestation").hide()
                    $("#chkAssistNo").removeProp("disabled")
                    $("#chkAssistYes").removeProp("disabled")
                    $("#divPreparerCertification").show()
                    //$("#divEmpSignature").show()
                }
            })

            $("#rblNonCitizen").click(function() {
                if ( $('#rblNonCitizen input:checked').val() == "No") {
                    $("#divChkPerm").show()
                    $("#divPreparerCertification").hide()
                }
                else { 
                    //$("#divChkNonCitizen").hide()
                    $("#divChkPerm").hide()
                    $("#divChkAlien").hide()
                    //$("#divChkNonCitizen input[type=radio]").prop('checked',false); 
                    $("#divChkPerm input[type=radio]").prop('checked',false); 
                    $("#divChkAlien input[type=radio]").prop('checked',false); 
                    $("#divEmployeeAttestation").hide()
                    $("#divPreparerCertification").show()
                }
            })

            $("#rblPerm").click(function() {
                if ( $('#rblPerm input:checked').val() == "No") {
                    $("#divChkAlien").show()
                    $("#divEmployeeAttestation").hide()
                    $("#divPreparerCertification").hide()
                }
                else {
                    $("#divChkAlien").hide()
                    //$("#divChkNonCitizen input[type=radio]").prop('checked',false); 
                    //$("#divChkPerm input[type=radio]").prop('checked',false); 
                    $("#divChkAlien input[type=radio]").prop('checked',false); 
                    $("#divEmployeeAttestation").show()
                    $("#divCitizen").hide()
                    $("#divNoncitizen").hide()
                    $("#divEmployeeAttestation2").hide()
                    $("#divPerm").show()
                    $("#txtAlienNum1").removeClass()
                    $("#txtAlienNum1").addClass("readwrite")

                }
            })

            $("#rblAlien").click(function() {
                if ( $('#rblAlien input:checked').val() == "Yes") {
                    $("#divEmployeeAttestation").show()
                    $("#divEmployeeAttestation2").show()
                    $("#divCitizen").hide()
                    $("#divNoncitizen").hide()
                    $("#divPerm").hide()
                    $("#txtAuthorizationExpDate").removeClass()
                    $("#txtAuthorizationExpDate").addClass("readwrite")
                    $("#txtAlienNum2").removeClass()
                    $("#txtAlienNum2").addClass("readwrite")
                    $("#txtI94Num").removeClass()
                    $("#txtI94Num").addClass("readwrite")
                    $("#txtForeignPPNum").removeClass()
                    $("#txtForeignPPNum").addClass("readwrite")
                    $("#txtForeignPPCountry").removeClass()
                    $("#txtForeignPPCountry").addClass("readwrite")
                }
            })


            $("body").on("focus", (".datepicker"), function (e) {
                var targetTemp = event.target
                $(targetTemp).css("background-color", "lightblue")
                pickDate()
            })

            $("body").on("focus", (".datepicker2"), function (e) {
                var prompt = $(this).attr("prompt")
                if ( $(this).val() == prompt ) $(this).val("")
                var targetTemp = event.target
                $(targetTemp).css("background-color", "lightblue")
                pickDate2()
            })


            $("body").on("click", (".authorization [id*=chk]"), setCheckBoxes)

            $("body").on("mousedown", ("#ddlStates"), function() { $("ddlStates").css("background-color", "lightblue") })

            $("body").on("focus", (".readonly"), function() { 
                popup(this)
                
                var foo = event.target
                console.log($(foo))
                
                $(foo).attr('readonly', true);
                
            } )

            $("body").on("keypress", (".numbers"), isNumberKey)

            $("body").on("keypress", ("input[id^=txtSSN]" ), isNumberKey)

            //$("#ddlStates").toggle()

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
                $("#spanAssist").css("background-color", "white")

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

            $("body").on("blur", (".datepicker"), function () {
                
                if (!checkdate(this)) {
                    var target = event.target
                    showDialog("Invalid date", $(this).val() + " is not a valid date.", target)
                    $(this).val("")
                }

                var currentDate = getCurrentDate()
                var date1 = new Date($(this).val())
                var date2 = new Date(currentDate)
                if (date1 < date2) {
                    showDialog("Invalid date", $(this).val() + " is not a valid date. Please select a future date.", target)
                    $(this).val("")

                }

            }); // End of blur

            $("body").on("blur", (".datepicker2"), function () {
                
                var currentDate = getCurrentDate()
                
                if (!checkdate(this)) {
                    var target = event.target
                    showDialog("Invalid date", $(this).val() + " is not a valid date.", target)
                    $(this).val("")
                }

                var date1 = new Date($(this).val())
                var date2 = new Date(currentDate)

                if (date1 > date2) {
                    showDialog("Invalid date", $(this).val() + " is not a valid date. Please select a prior date.", target)
                    $(this).val("")

                }
                if ( $(this).val() == "" ) $(this).val($(this).attr("prompt"))
            }); // End of blur


            function setAttestation(targetItem){
                var itemID = $(targetItem).prop("id")
                var itemChecked = $(targetItem).prop("checked")

                $("#txtAlienNum1").removeClass()
                $("#txtAuthorizationExpDate").removeClass()
                $("#txtAlienNum2").removeClass()
                $("#txtI94Num").removeClass()
                $("#txtForeignPPNum").removeClass()
                $("#txtForeignPPCountry").removeClass()

                
                $("#txtAlienNum1").css("background-color", "lightgray")
                $("#txtAlienNum1").addClass("readonly")
                
                $("#txtAuthorizationExpDate").css("background-color", "lightgray")
                $("#txtAuthorizationExpDate").addClass("readonly")
                $('#txtAuthorizationExpDate').removeClass('datepicker');
                $('#txtAuthorizationExpDate').removeClass('hasDatepicker');
                $('#txtAuthorizationExpDate').unbind();
                $("#txtAuthorizationExpDate").removeClass('hasDatepicker')
                
                $("#txtAlienNum2").css("background-color", "lightgray")
                $("#txtAlienNum2").addClass("readonly")
                $("#txtI94Num").css("background-color", "lightgray")
                $("#txtI94Num").addClass("readonly")
                $("#txtForeignPPNum").css("background-color", "lightgray")
                $("#txtForeignPPNum").addClass("readonly")
                $("#txtForeignPPCountry").css("background-color", "lightgray")
                $("#txtForeignPPCountry").addClass("readonly")
                
                if (itemChecked == false) {
                    $("#txtAlienNum1").val("")
                    $("#txtAuthorizationExpDate").val("")
                    $("#txtAlienNum2").val("")
                    $("#txtI94Num").val("")
                    $("#txtForeignPPNum").val("")
                    $("#txtForeignPPCountry").val("")
                    return

                }

                if (itemID == "I9_chkPerm" ) {

                    $("#txtAlienNum1").prop("disabled", false)
                    $("#txtAlienNum1").css("background-color", "lightblue")
                    $("#txtAlienNum1").removeClass()
                    $("#txtAlienNum1").addClass("readwrite")
                    $("#txtAlienNum1").off("focus")
                    $("#txtAuthorizationExpDate").val("")
                    $("#txtAlienNum2").val("")
                    $("#txtI94Num").val("")
                    $("#txtForeignPPNum").val("")
                    $("#txtForeignPPCountry").val("")

                
                }
                if (itemID == "I9_chkAlien") {
                    $("#txtAuthorizationExpDate").prop("disabled", false)
                    $("#txtAuthorizationExpDate").css("background-color", "lightblue")
                    $("#txtAuthorizationExpDate").removeClass()
                    $("#txtAuthorizationExpDate").addClass("datepicker")
                    $("#txtAuthorizationExpDate").off("focus")
                    
                    $("#txtAlienNum2").prop("disabled", false)
                    $("#txtAlienNum2").css("background-color", "lightblue")
                    $("#txtAlienNum2").removeClass()
                    $("#txtAlienNum2").addClass("readwrite")
                    $("#txtAlienNum2").off("focus")
                    
                    $("#txtI94Num").prop("disabled", false)
                    $("#txtI94Num").css("background-color", "lightblue")
                    $("#txtI94Num").removeClass()
                    $("#txtI94Num").addClass("readwrite")
                    $("#txtI94Num").off("focus")

                    $("#txtForeignPPNum").prop("disabled", false)
                    $("#txtForeignPPNum").css("background-color", "lightblue")
                    $("#txtForeignPPNum").removeClass()
                    $("#txtForeignPPNum").addClass("readwrite")
                    $("#txtForeignPPNum").off("focus")

                    $("#txtForeignPPCountry").prop("disabled", false)
                    $("#txtForeignPPCountry").css("background-color", "lightblue")
                    $("#txtForeignPPCountry").removeClass()
                    $("#txtForeignPPCountry").addClass("readwrite")
                    $("#txtForeignPPCountry").off("focus")

                    $("#txtAlienNum1").val("")

                }

                if  (itemID == "I9_chkCitizen" || itemID == "I9_chkNonCitizen") {
                    $("#txtAlienNum1").val("")
                    $("#txtAuthorizationExpDate").val("")
                    $("#txtAlienNum2").val("")
                    $("#txtI94Num").val("")
                    $("#txtForeignPPNum").val("")
                    $("#txtForeignPPCountry").val("")

                }
            }


            $("#I9_divEmployeeAttestation input[type=checkbox").on("click", function() {
                var item = event.target;
                setAttestation(item);
            })

            function getCurrentDate() {
                var currentDate = new Date()

                var month = currentDate.getMonth() + 1
                var day = currentDate.getDate()
                var year = currentDate.getFullYear()

                console.log($(day).length)
                console.log(month)
                console.log(day)
                console.log(year)

                if (day < 10) day = '0' + day;
                if (month < 10) month = '0' + month;
               
                return month + "/" + day + "/" + year
            }

        }) // *** End Ready function *** 

        function chkCitizenship(e) {
            var targetTemp = event.target
            var targetID = $(targetTemp).prop("id")
            console.log($(targetTemp))
            console.log($(e))
            console.log($(this))
            console.log(this)

            if (targetID == "chkCitizenNo") {
                if ( $(targetTemp).is(":checked") ) $("#divChkNonCitizen").show()
                else  {
                    $("#divChkNonCitizen").hide()
                    $("#divChkNonCitizen input[type=checkbox").attr('checked',false)
                }
            }
        }

        function test(target) {
            $(target).parent().next().focus()
            $(target).hide()
            
        }

        function saveSuccessful(){
            messagetext = "Save successful"
            //if ($("#<%=chkSignature.ClientID%>").prop('checked')) {
            //    messagetext = messagetext + "Signature certified"
            //    $("#dialog").css("background-color", "lightgreen")
            //}
            //else {
            //    messagetext = messagetext + "Signature not certified"
            //    $("#dialog").css("background-color", "lightsalmon")
            //}
            //$(".header-container input[type=submit]").prop("disabled", true)
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
            
            $("#btnDone").val('Exit');
            $("#btnSubmit").hide()
            $("#SubmittedH").val("True")
            $("#btnContinueEmployeeSignature").hide()
            return false
            
            //alert('sent by C#')
        }


        function changeAddress(e){
            //$("#ddlStates").toggle()
            $("#txtState").toggle()

            if ($(e).prop('checked')) { 
                $("#I9_divEmployee input[type=text]").removeClass("readonly")
                $("#ddlStates").removeClass("readonly")
                $("#I9_divEmployee input[type=text]").addClass("readwrite")
                $("#ddlStates").addClass("readwrite")
                $("#ddlStates").prop("disabled", false)
                $("#txtBirth").addClass("datepicker")
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
                $("#I9_divEmployee input[type=text]").addClass("readonly")
                $("#I9_divEmployee input[type=text]").removeClass("readwrite")
                $("#I9_divEmployee input[type=text]").removeClass("datepicker")
                $("#ddlStates").removeClass("readwrite")
                $("#ddlStates").addClass("readonly")
                $("#ddlStates").prop("disabled", true)
                $("#txtBirth").css("color","black")
                $("#txtBirth").datepicker("destroy")
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
            
        };

        function showCheckSignature(e) {
            this.blur()
            //var itemname = $(e).prop("id") 
            var signed = true;    
            var message
            targetItem = event.target

            var result = validityCheckCeritfySignature()
            
            if (result == false) {
                $("#dialog").css("background-color", "lightsalmon")
                showDialog('Blank items', "Cannot have Signature Certified until any item in red is no longer blank")
                return false

            }
            

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
                        $("btnEdit").show();
                    },
                    "No": function () {
                        $(this).dialog('close');
                        $(foo2).prop('checked', false)
                        //$("#I9_chkSignature").prop('checked', false)
                        //$(".SigCertifyEmp").css("background-color", "lightsalmon")
                        $(foo3).css("background-color", "lightsalmon") 
                        $("#btnContinueEmployeeAttestation").show()
                    }
                }   
            });

        }


        function validityCheckdivEmployee() {
            var result = validityCheckdivEmployee2()
            if ($('#rblPerm input:checked').val() == "Yes") {
                if ($("#txtAlienNum1").val().trim() == "")
                {
                    $("#txtAlienNum1").css("background-color", "lightsalmon")
                    return false
                }
            }

            if (result == false) {
                //$("#dialog").css("background-color", "lightsalmon")
                //showDialog('Blank items', "Cannot have Signature Certified until any item in red is no longer blank")
                return false

            }
            else return true

        }
        function validityCheckdivEmployee2() {
            var OK = true

            lastname = $("#txtLastName")
            firstname = $("#txtFirstName")
            address = ("#txtAddress")
            city = $("#txtCity")
            zip = $("#txtZip")
            birth = $("#txtBirth")
            ssn1 = $("#txtSSN1")
            ssn2 = $("#txtSSN2")
            ssn3 = $("#txtSSN3")
            state = $("#ddlStates")

            if ($(state).val() == ""){
                $(state).css("background-color", "lightsalmon")
                OK = false
            }

            if ($(lastname).val() == "") { 
                $(lastname).css("background-color", "lightsalmon")
                OK = false 
            }
            if ($(firstname).val() == "") { 
                $(firstname).css("background-color", "lightsalmon")
                OK = false 
            }

            if ($(address).val() == "") { 
                $(address).css("background-color", "lightsalmon")
                OK = false 
            }
            
            if ($(city).val() == "") { 
                $(city).css("background-color", "lightsalmon")
                OK = false 
            }

            if ($(zip).val() == "") { 
                $(zip).css("background-color", "lightsalmon")
                OK = false 
            }

            if ($(birth).val() == "") {
                $(birth).css("background-color", "lightsalmon")
                OK = false
            }

            if ( $(ssn1).val().length != 3 ) { 
                $(ssn1).css("background-color", "lightsalmon")
                OK = false
            }
            if ( $(ssn2).val().length != 2 ) {
                $(ssn2).css("background-color", "lightsalmon")
                OK = false
            }
            if ( $(ssn3).val().length != 4 ) {
                $(ssn3).css("background-color", "lightsalmon")
                OK = false
            }

            if ($(birth).val() == "") {
                $(birth).css("background-color", "lightsalmon")
                OK = false
            }

            var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
            
            if ( pattern.test($(txtEmail).val()) == false && $(txtEmail).val().trim() != "" )
            {
                $(txtEmail).css("background-color", "lightsalmon")
                OK = false
            }

            var pattern = /^[\d\s\.\-]+$/;
            
            if ( pattern.test($("#txtPhone").val()) == false && $("#txtPhone").val().trim() != "" )
            {
                $("#txtPhone").css("background-color", "lightsalmon")
                OK = false
            }

            
            
            return OK    
            
            
        }

        function validityCheckCeritfySignature() {
            var OK = true

            //lastname = $("#txtLastName")
            //firstname = $("#txtFirstName")
            //address = ("#txtAddress")
            //city = $("#txtCity")
            //zip = $("#txtZip")
            //birth = $("#txtBirth")
            //ssn1 = $("#txtSSN1")
            //ssn2 = $("#txtSSN2")
            //ssn3 = $("#txtSSN3")
            //state = $("#ddlStates")
            signature = $("#txtSig")
            signaturedate = $("#txtSigDate")
            assistNo = $("#chkAssistNo")
            assistYes = $("#chkAssistYes")

            //if ($(state).val() == ""){
            //    $(state).css("background-color", "lightsalmon")
            //    OK = false
            //}
            //
            //if ($(lastname).val() == "") { 
            //    $(lastname).css("background-color", "lightsalmon")
            //    OK = false 
            //}
            //if ($(firstname).val() == "") { 
            //    $(firstname).css("background-color", "lightsalmon")
            //    OK = false 
            //}
            //
            //if ($(address).val() == "") { 
            //    $(address).css("background-color", "lightsalmon")
            //    OK = false 
            //}
            //
            //if ($(city).val() == "") { 
            //    $(city).css("background-color", "lightsalmon")
            //    OK = false 
            //}
            //
            //if ($(zip).val() == "") { 
            //    $(zip).css("background-color", "lightsalmon")
            //    OK = false 
            //}
            //
            //if ($(birth).val() == "") {
            //    $(birth).css("background-color", "lightsalmon")
            //    OK = false
            //}
            //
            //if ( $(ssn1).val().length != 3 ) { 
            //    $(ssn1).css("background-color", "lightsalmon")
            //    OK = false
            //}
            //if ( $(ssn2).val().length != 2 ) {
            //    $(ssn2).css("background-color", "lightsalmon")
            //    OK = false
            //}
            //if ( $(ssn3).val().length != 4 ) {
            //    $(ssn3).css("background-color", "lightsalmon")
            //    OK = false
            //}
            //
            //if ($(birth).val() == "") {
            //    $(birth).css("background-color", "lightsalmon")
            //    OK = false
            //}

            //if ($(signaturedate).val() == "") {
            //    $(signaturedate).css("background-color", "lightsalmon")
            //    OK = false
            //}
            
            //if ($(signature).val() == "") {
            //    $(signature).css("background-color", "lightsalmon")
            //    OK = false
            //}

            //var citizenship = false
            //if ($("#I9_chkCitizen").prop("checked") == true ) citizenship = true
            //if ($("#I9_chkNonCitizen").prop("checked") == true ) citizenship = true
            //if ($("#I9_chkPerm").prop("checked") == true ) citizenship = true
            //if ($("#I9_chkAlien").prop("checked") == true ) citizenship = true

            //if (!citizenship) {
            //    $(".authorization").css("background-color", "lightsalmon")
            //    $("body").one("click", ("#I9_divEmployeeAttestation input[type=checkbox]"), function() { 
            //        $(".authorization").css("background-color", "white")
            //    })
            //    OK = false;
            //
            //}

            if ($(assistNo).prop("checked") == false && $(assistYes).prop("checked") == false)  {
                $("#spanAssist").css("background-color", "lightsalmon")
                $("body").one("click", ("#divPreparerCertification"), function() { 
                    $("#spanAssist").css("background-color", "lightsalmon")
                })

                OK = false;
            }
        
            return OK

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
        <img id="logo" src="/images/WH_I9Logo.jpg" />
    </div>
    <hr />
    <div class="justifyLeft">
        <div class="comment more">
            START HERE. Read instructions carefully before completing this form. The instructions must be available during completion of this form. ANTI-DISCRIMINATION NOTICE: It is illegal to discriminate against work-authorized individuals. Employers CANNOT specify which
            document(s) they will accept from an employee. The refusal to hire an individual because the documentation presented has a future
            expiration date may also constitute illegal discrimination.
        </div>
    </div>
    <div id="divEmployee" runat="server" class="attestation">
        <div class="sectionHeader" style="border-bottom:1px solid black">
            <b>Section 1. Employee Information and Attestation</b> <em>(Employees must complete and sign Section 1 of Form I-9 no later
            than the <b>first day of employment,</b> but not before accepting a job offer.)</em>
        </div>
        <div class="row">
            <div class="col60">
                <div class="innerWrapper">
                        <div class="finalContainer">
                            <div class="final">Last Name (<em>Family Name</em>)</div>
                            <div class="final"><asp:TextBox ID="txtLastName" runat="server" ToolTip="Last Name (Family Name)" CssClass="readonly" ClientIDMode="Static" ></asp:TextBox></div>
                        </div>
                        <div class="finalContainer" >
                            <div class="final">First Name (<em>Given Name</em>)</div>
                            <div class="final"><asp:TextBox ID="txtFirstName" runat="server" ToolTip="First Name" CssClass="readonly" ClientIDMode="Static" ></asp:TextBox></div>
                        </div>

                        <div class="finalContainer" >
                            <div class="final">Middle Initial</div> 
                            <div class="final"><asp:TextBox ID="txtMiddle" runat="server" ToolTip="Middle Name" Width="20px" CssClass="readonly" ClientIDMode="Static"></asp:TextBox></div>
                        </div>
                </div>
            </div> <!--End col60 -->
     
            <div>
                <div class="innerWrapper" >
                    <div class="finalContainer">
                        <div>Other Names (<em>if any</em>)</div>
                        <div><asp:TextBox ID="txtOtherName" runat="server" ToolTip="Other Names (if any)" TabIndex="-1" CssClass="readonly" ></asp:TextBox></div>
                    </div>
                    </div>
            </div>
        </div> <!--End row -->

            <div style="border-top:1px solid black"></div>
            <div class="row">
                <div class="col40">
                    
                        <div class="finalContainer">
                            <div>Address (<em>Street number and name)</em></div>
                            <div><asp:TextBox ID="txtAddress" runat="server" ToolTip="Address" ClientIDMode="Static" CssClass="readonly"></asp:TextBox></div>
                        </div>
                    
                </div>
                <div class="col10">
                    <div class="innerWrapper">
                        <div class="finalContainer" >
                            <div>Apt. Number</div>
                            <div><asp:TextBox ID="txtAptNum" runat="server" ToolTip="Apt. Number" Width="40px" CssClass="readonly"></asp:TextBox></div>
                        </div>
                    </div>
                </div>
                <div class="col20">
                    <div class="innerWrapper">
                        <div class="finalContainer" >
                            <div>City or Town</div>
                            <div><asp:TextBox ID="txtCity" runat="server" ToolTip="City" ClientIDMode="Static" CssClass="readonly"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div class="col10">
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>State</div>
                        <div>
                            <asp:TextBox ID="txtState" runat="server" Width="25px" CssClass="readonly"></asp:TextBox>
                            <asp:DropDownList ID="ddlStates" ToolTip="State" runat="server" ClientIDMode="Static" CssClass="readonly"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="innerWrapper">
                    <div class="finalContainer" >
                        <div>ZIP Code</div> 
                        <div><asp:TextBox ID="txtZip" ToolTip="ZIP" runat="server" Width="45px" ClientIDMode="Static" CssClass="readonly"></asp:TextBox>
                            - <asp:TextBox ID="txtZip4" ToolTip="ZIP+4" Width="35px" CssClass="readonly" runat="server"></asp:TextBox>
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
                        <div><asp:TextBox ID="txtBirth" runat="server" ToolTip="Date of Birth(<em>(mm/dd/yyyy)</em>)" CssClass="readonly" ClientIDMode="Static"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div class="col20">
                <div class="innerWrapperFoo">
                    <div class="finalContainer" >
                        <div>Social Security Number</div>
                        <div style="display:flex">
                            <div><asp:TextBox ID="txtSSN1" ToolTip="SSN" runat="server" Width="30px" MaxLength="3" CssClass="readonly" ClientIDMode="Static"></asp:TextBox></div> -
                            <div><asp:TextBox ID="txtSSN2" ToolTip="SSN" runat="server" Width="20px" MaxLength="2" CssClass="readonly" ClientIDMode="Static"></asp:TextBox></div> - 
                            <div><asp:TextBox ID="txtSSN3" ToolTip="SSN" runat="server" Width="35px" MaxLength="4" CssClass="readonly" ClientIDMode="Static"></asp:TextBox></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col30">
                <div class="innerWrapperFoo">
                    <div class="finalContainer" >
                        <div>Email</div>
                        <div><asp:TextBox ID="txtEmail" ToolTip="Email address" runat="server" Width="240px" ClientIDMode="Static" CssClass="readonly"></asp:TextBox></div>
                    </div>
                </div>
            </div>
            <div>
                <div class="innerWrapper" >
                    <div class="finalContainer" >
                        <div>Telephone Number</div>
                        <div><asp:TextBox ID="txtPhone" ToolTip="Telephone number" runat="server" Width="120px" ClientIDMode="Static" CssClass="readonly"></asp:TextBox></div>
                    </div>
                 </div>
            </div>
        </div> <!--End row -->
        
        <div style="border-top:1px solid black"></div>        
        
        <div class="centerInner" >
            <span><asp:CheckBox ID="chkChange" Text="Change Address" runat="server" onclick="changeAddress(this)" /></span>
        </div>

        <div style="border-top:1px solid black"></div>
        
        <div class="centerInner" >
            <asp:Button ID="btnContinueEmployee" ClientIDMode="Static" runat="server" Text="Continue..." OnClientClick="return validityCheckdivEmployee();" OnClick="btnContinueEmployee_Click" CssClass="continueButton" />
        </div>
        
    </div> <!--End Attestation -->


    <br />
    <div id="divCitizenhipQuestions" runat="server" class="attestation">
        <div id="divChkCitizen" ClientIDMode="static" runat="server">
            Are you a citizen of the United States? 
            <asp:RadioButtonList ID="rblCitizen" ClientIDMode="Static" RepeatDirection="Horizontal" runat="server">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div id="divChkNonCitizen" ClientIDMode="static" runat="server">
            Are you a Non-citizen National of the United States? 
            <asp:RadioButtonList ID="rblNonCitizen" ClientIDMode="Static" RepeatDirection="Horizontal" runat="server">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div id="divChkPerm" ClientIDMode="static" runat="server">
            Are you a lawful permanent resident? 
            <asp:RadioButtonList ID="rblPerm" ClientIDMode="Static" RepeatDirection="Horizontal" runat="server">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div id="divChkAlien" ClientIDMode="static" runat="server">
            Are you an alien authorized to work? 
            <asp:RadioButtonList ID="rblAlien" ClientIDMode="Static" RepeatDirection="Horizontal" runat="server">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>

    <br />
    <div id="divEmployeeAttestation" ClientIDMode="Static" runat="server" class="attestation">
        <b>I am aware that federal law provides for imprisonment and/or fines for false statements or use of false documents in
        connection with the completion of this form.<br />
        I attest, under penalty of perjury, that I am :</b>
    
        <div style="display:flex; flex-direction:column; border:1px solid black">
            
            <div id="divCitizen" ClientIDMode="Static" runat="server" style="display:flex; flex-direction:row;border-bottom:1px solid black">
                <div>
                    <asp:CheckBox ID="chkCitizen" ClientIDMode="Static" runat="server" CssClass="authorization" /></div><div style="margin-left:5px">A citizen of the United States
                </div>
                <br />
	        </div>
            
            <div id="divNoncitizen" ClientIDMode="Static" runat="server" style="display:flex; flex-direction:row;border-bottom:1px solid black">
                <div>
                    <asp:CheckBox ClientIDMode="Static" ID="chkNonCitizen" runat="server" CssClass="authorization" />
                </div>
                <div style="margin-left:5px">
                    A noncitizen national of the United States (See instructions)
                </div>
                <br />
            </div>
            
            <div id="divPerm" ClientIDMode="Static" runat="server" style="display:flex; flex-direction:row;border-bottom:1px solid black">
                <div>
                    <asp:CheckBox ID="chkPerm" ClientIDMode="Static" runat="server" CssClass="authorization"/>
                </div>
                <div style="margin-left:5px">
                    A lawful permanent resident (Alien Registration Number/USCIS Number): 
                    <asp:TextBox ID="txtAlienNum1" runat="server" ClientIDMode="Static" MaxLength="9" CssClass="numbers readonly" ></asp:TextBox>
                </div>
                <br />
            </div>

            <div id="divEmployeeAttestation2" ClientIDMode="Static" runat="server" style="display:flex; flex-direction:row">
                <div id="divAlien" ClientIDMode="Static" runat="server">
                    <asp:CheckBox ID="chkAlien" ClientIDMode="Static" runat="server" CssClass="notdatepicker authorization"/></div><div style="margin-left:5px">An alien authorized to work until (expiration date, if applicable, mm/dd/yyyy)
                    <asp:TextBox ID="txtAuthorizationExpDate" runat="server" ClientIDMode="Static" class="readonly"></asp:TextBox>
                    Some aliens may write "N/A" in this field.<br /><em>(See instructions)
                    <br />
                    Aliens authorized to work must provide only one of the following document numbers to complete form I-9:
                    <br />
                    An alien Registration Number/USCIS Number <b>OR</b> Form I-94 Admission Number <b>OR</b> Foreign Passport Number.</em>
                    <br />
                    <br />
                    <b>1.</b> Alien Registration Number/USCIS Number: <asp:TextBox ID="txtAlienNum2" ClientIDMode="Static" runat="server" MaxLength="9" CssClass="numbers readonly"></asp:TextBox>
                    <br />
                    <b>OR</b>
                    <br />      
                    <b>2.</b> Form I-94 Admission Number: <asp:TextBox ID="txtI94Num" runat="server" ClientIDMode="Static" CssClass="numbers readonly"></asp:TextBox>
                    <br />
                    <b>OR</b>
                    <br />      
                    <b>3.</b> Foreign Passport Number: <asp:TextBox ID="txtForeignPPNum" runat="server" ClientIDMode="Static" CssClass="numbers readonly"></asp:TextBox>
                    <br />
                    <div style="margin-left:15px; margin-top:8px">
                        Country of Issuance: <asp:TextBox ID="txtForeignPPCountry" ClientIDMode="Static" runat="server" CssClass="readonly"></asp:TextBox>
                    </div>
                </div>
            </div> <!-- End Alien / EmployeeAttestation2 -->
            <div style="border-top:1px solid black"></div>
            <div class="centerInner" >
                <asp:Button ID="btnContinueEmployeeAttestation" ClientIDMode="Static" runat="server" Text="Continue..." OnClientClick="return validityCheckdivEmployee();" OnClick="btnContinueEmployee_Click"  CssClass="continueButton" />            
            </div> <!--End row -->

        </div>
    </div> <!--End Attestation2-->

    <br />
    <div id="divPreparerCertification" ClientIDMode="Static" runat="server" class="attestation">
        <div class="sectionHeader">
            <b>Preparer and/or Translator Certification (check one):</b> 
            <br />
            <span id="spanAssist" style="display:inline-block; padding:1px">
                <asp:CheckBox ID="chkAssistNo"  ClientIDMode="Static" runat="server" Text="I did not use a perparer or translator." />
                <br />
                <asp:CheckBox ID="chkAssistYes" ClientIDMode="Static" runat="server" Text="A preparer(s) and/or translator(s) assisted the employee in completing Section 1." />
            </span>
            <br />
            <em>(Fields below must be completed and signed we preparers and/or translators assist an employee in completing Section 1.)</em>
        </div>
        <div class="centerInner" style="width:100%" >
            <asp:Button ID="btnContinuePreparerCertification" ClientIDMode="Static" runat="server" Text="Continue..." OnClientClick="return validityCheckCeritfySignature();" OnClick="btnContinueEmployee_Click" CssClass="continueButton"  />
        </div>
        
    </div>
    <br />
    <div id="divEmpSignature" ClientIDMode="static" runat="server" class="attestation">
        <div class="row">
            <div class="col50">
                <div>&nbsp;Signature of Employee: <span style="display: inline-block;margin-top:5px;margin-bottom:3px"><asp:TextBox ID="txtSig" Width="200px" runat="server" ClientIDMode="Static" CssClass="notdatepicker readonly" ></asp:TextBox></span></div>
            </div>
            <div id="divSigCertifyEmp" runat="server" class="col20 SigCertifyEmp" ClientIDMode="static">
                <div style="margin-top:4px">
                    &nbsp;Signature Certified: 
                    <asp:CheckBox ID="chkSignature" onclick ="return showCheckSignature(this)" runat="server" />
                </div>
            </div>
            <div id="divEmpSignatureDate" class="finalContainer" runat="server">
                <div>
                Date <em>(mm/dd/yyyy): </em><span style="display: inline-block;margin-top:5px"><asp:TextBox ID="txtSigDate" ClientIDMode="Static" runat="server" class="readonly"></asp:TextBox></span>
                </div>
            </div>
        </div>                
        <div class="centerInner" >
            <asp:Button ID="btnContinueEmployeeSignature" ClientIDMode="Static" runat="server" Text="Save" OnClientClick="/*return validityCheckdivEmployee();*/" OnClick="btnContinueEmployee_Click" CssClass="continueButton" />
        </div>
    </div>
    <br />
    <div id="divPreparer" runat="server" class="attestation preparer">
    <div class="attestation2">
        <b>I attest, under penalty of perjury, that I have assisted in the completion of this form and that to the best of my knowledge the information is true and correct.</b>
    </div>

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

        <div style="text-align:center">
            <!-- <div>
                <img src="/Images/WH_I9Logo.jpg" height="46" />
            </div>
            <div style="font-family:Arial; height:50%">
                <b>Page One</b>
            </div>-->
            
                <asp:Button ID="btnEmail" runat="server" Text="Email" CssClass="button" OnClick="btnEmail_Click" />  
                <asp:Button ID="btnViewPDF" runat="server" Text="View PDF" CssClass="button" ClientIDMode="Static" OnClick="btnViewPDF_Click" />
                <!-- <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" ClientIDMode="Static" CssClass="button" />  -->
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="button" OnClientClick="return validityCheck()" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="buttonred " OnClick="btnCancel_Click" />
                <asp:Button ID="btnDone" runat="server" Text="Exit" CssClass="button" ClientIDMode="Static" OnClick="btnDone_Click"  />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit I-9" CssClass="buttongreen" ClientIDMode="Static" OnClientClick="return submitSuccessful()" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnPage2" runat="server" Text="Page 2" CssClass="button" OnClick="btnPage2_Click" />
            
        </div>

    <br />
    <hr />
    <div class="review">
        Form I-9 7/17/2017 N
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


<asp:HiddenField ID="txtLastNameH" ClientIDMode="Static" runat="server" />
<asp:HiddenField ID="txtFirstNameH" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="txtMiddleH" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="txtAddressH" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="txtCityH" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="txtStateH" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="txtZipH" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="txtZip4H" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="txtBirthH" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="txtSSN1H" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="txtSSN2H" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="txtSSN3H" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="txtEmailH" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="txtPhoneH" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="txtSignatureCertifyEmpDateH" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="SubmittedH" runat="server" ClientIDMode="Static" />
