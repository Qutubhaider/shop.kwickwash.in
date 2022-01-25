﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lost-password.aspx.cs" Inherits="lost_password" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicon.png">
    <title class="title">Lost Password? - KwickWash</title>
    <!-- Bootstrap Core CSS -->
    <link href="assets/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="assets/css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="assets/css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="assets/css/colors/default.css" id="theme" rel="stylesheet">
    <link href="assets/plugins/bower_components/toast-master/css/jquery.toast.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
    <form id="flostpassword" runat="server">
        <!-- Preloader -->
        <div class="preloader">
            <div class="cssload-speeding-wheel"></div>
        </div>
        <section id="wrapper" class="new-login-register">
            <div class="lg-info-panel">
                <div class="inner-panel">
                    <a href="javascript:void(0)" class="p-20 di">
                        <img src="assets/img/logo.png" style="width: 150px; height: auto;"></a>
                    <!--       <div class="lg-content">
                          <h2>E-COMMERCE.COM<br>E-commerce System</h2> -->
                    <!--  <p class="text-muted">Efforts Made To Maintain or Restore Physical, Mental, or Emotional well-being especially By Trained and Licensed Professionals.</p> -->
                    <!--   <a href="javascript:void(0)" class="btn btn-rounded btn-danger p-l-20 p-r-20"> Visit Site</a> -->
                </div>
            </div>
            <div class="new-login-box">
                <div class="white-box">
                    <div id="alertQuery" class="" style="display: none;">
                        <strong>Success!</strong> Send successfully !!.
                    </div>
                    <h3 class="box-title m-b-0">Lost Password?</h3>
                    <small>Give us your email then we post your password!</small>
                    <div class="form-horizontal new-lg-form">
                        <div class="form-group  m-t-20">
                            <div class="col-xs-12">
                                <label>Email-id</label>
                                <asp:TextBox ID="txtemailid" runat="server" placeholder="Enter your email-id" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group text-center m-t-20">
                            <div class="col-xs-12">
                                <asp:Button ID="btnsend" runat="server" Text="Submit" CssClass="btn btn-info text-uppercase" OnClick="btnsend_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- jQuery -->
        <script src="assets/plugins/bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="assets/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- Menu Plugin JavaScript -->
        <script src="assets/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>

        <!--slimscroll JavaScript -->
        <script src="assets/js/jquery.slimscroll.js"></script>
        <!--Wave Effects -->
        <script src="assets/js/waves.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="assets/js/custom.min.js"></script>



        <script type="text/javascript">
            function callLogin() {
                $('#loader').show();
                $('#btnLogin').hide();
                var username = $('#txtUser').val();
                var password = $('#txtPass').val();
                var role = "shop";

                $(".error").remove();
                if (username.length == "") {
                    $('#txtUser').after('<span class="error">This field is required</span>');
                    $('#txtUser').addClass('txterror');
                }
                else if (password.length == "") {
                    $('#txtUser').remove('txterror');
                    $('#txtUser').addClass('txtsussess');
                    $('#txtPass').after('<span class="error">This field is required</span>');
                    $('#txtPass').addClass('txterror');
                }
                else {
                    var data = "{username:'" + username + "',password:'" + password + "',role:'" + role + "'}";

                    var url = "apiService.asmx/login";


                    $.ajax({
                        url: url,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        type: 'POST',
                        data: data,
                        success: function (data, XMLHttpRequest) {
                            $('#loader').hide();
                            $('#btnLogin').show();
                            if (data.d == 0) {
                                $('#alertQuery').addClass('alert alert-danger');
                                $('#alertQuery').html('Enter valid username and password !');
                                $('#alertQuery').fadeIn(2000);
                                $('#alertQuery').fadeOut(4000);
                            }
                            else if (data.d == 1) {
                                window.location.href = 'dashboard.html';
                            }
                            else if (data.d == 2) {
                                $('#loader').hide();
                                $('#btnLogin').show();
                                $('#alertQuery').addClass('alert alert-danger');
                                $('#alertQuery').fadeIn(2000);
                                $('#alertQuery').html('');
                                $('#alertQuery').html('Enter valid username and password !');
                                $('#alertQuery').fadeOut(4000);
                            }
                        },
                        error: function (errorThrown) {
                            $('#loader').hide();
                            ret = "error";
                            //alert(ret);
                        }
                    });
                }
            }

            var wage = document.getElementById("txtPass");
            wage.addEventListener("keydown", function (e) {
                if (e.keyCode === 13) {
                    callLogin();
                }
            });

        </script>
    </form>
</body>
</html>
